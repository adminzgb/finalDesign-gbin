<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/finalDesign/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="/finalDesign/static/css/main.css" rel="stylesheet"
	type="text/css" />

<!-- Owl Carousel Assets -->
<link href="/finalDesign/static/owl-carousel/owl.carousel.css"
	rel="stylesheet">
<!-- <link href="owl-carousel/owl.theme.css" rel="stylesheet"> -->

<!-- Custom CSS -->
<link rel="stylesheet" href="/finalDesign/static/css/style.css">

<!-- Custom Fonts -->
<link rel="stylesheet"
	href="/finalDesign/static/css/font-awesome-4.4.0/css/font-awesome.min.css"
	type="text/css">
<title>直播测试</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="/dist/css/main.css">
<style>
audio {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<audio autoplay id="a" controls></audio>
	<button id="micBtn">话筒开启</button>
	<button id="sayBtn">说话</button>
	<button id="btn">发送</button>
</body>
<script src="/lib/socket.io/socket.io-1.2.0.js"></script>
<script type="text/javascript"
	src="/finalDesign/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/bootstrap.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/layer.js"></script>
<script type="text/javascript" src="/finalDesign/static/js/main.js"></script>
<script>
	(function() {
		var params = {
			sendBtn : document.getElementById('btn'),
			sayBtn : document.getElementById('sayBtn'),
			serverIP : '192.168.31.140'
		};

		function getBlob(buffer) {
			var data = new DataView(buffer);
			return new Blob([ data ], {
				type : 'audio/wav'
			});
		}

		var SRecorder = function(stream) {
			config = {};

			config.sampleBits = config.smapleBits || 8;
			config.sampleRate = config.sampleRate || (44100 / 6);

			var context = new AudioContext();
			var audioInput = context.createMediaStreamSource(stream);
			var recorder = context.createScriptProcessor(4096, 1, 1);

			var audioData = {
				size : 0 //录音文件长度
				,
				buffer : [] //录音缓存
				,
				inputSampleRate : context.sampleRate //输入采样率
				,
				inputSampleBits : 16 //输入采样数位 8, 16
				,
				outputSampleRate : config.sampleRate //输出采样率
				,
				oututSampleBits : config.sampleBits //输出采样数位 8, 16
				,
				clear : function() {
					this.buffer = [];
					this.size = 0;
				},
				input : function(data) {
					this.buffer.push(new Float32Array(data));
					this.size += data.length;
				},
				compress : function() { //合并压缩
					//合并
					var data = new Float32Array(this.size);
					var offset = 0;
					for (var i = 0; i < this.buffer.length; i++) {
						data.set(this.buffer[i], offset);
						offset += this.buffer[i].length;
					}
					//压缩
					var compression = parseInt(this.inputSampleRate
							/ this.outputSampleRate);
					var length = data.length / compression;
					var result = new Float32Array(length);
					var index = 0, j = 0;
					while (index < length) {
						result[index] = data[j];
						j += compression;
						index++;
					}
					return result;
				},
				encodeWAV : function() {
					var sampleRate = Math.min(this.inputSampleRate,
							this.outputSampleRate);
					var sampleBits = Math.min(this.inputSampleBits,
							this.oututSampleBits);
					var bytes = this.compress();
					var dataLength = bytes.length * (sampleBits / 8);
					var buffer = new ArrayBuffer(44 + dataLength);
					var data = new DataView(buffer);

					var channelCount = 1;//单声道
					var offset = 0;

					var writeString = function(str) {
						for (var i = 0; i < str.length; i++) {
							data.setUint8(offset + i, str.charCodeAt(i));
						}
					};

					// 资源交换文件标识符 
					writeString('RIFF');
					offset += 4;
					// 下个地址开始到文件尾总字节数,即文件大小-8 
					data.setUint32(offset, 36 + dataLength, true);
					offset += 4;
					// WAV文件标志
					writeString('WAVE');
					offset += 4;
					// 波形格式标志 
					writeString('fmt ');
					offset += 4;
					// 过滤字节,一般为 0x10 = 16 
					data.setUint32(offset, 16, true);
					offset += 4;
					// 格式类别 (PCM形式采样数据) 
					data.setUint16(offset, 1, true);
					offset += 2;
					// 通道数 
					data.setUint16(offset, channelCount, true);
					offset += 2;
					// 采样率,每秒样本数,表示每个通道的播放速度 
					data.setUint32(offset, sampleRate, true);
					offset += 4;
					// 波形数据传输率 (每秒平均字节数) 单声道×每秒数据位数×每样本数据位/8 
					data.setUint32(offset, channelCount * sampleRate
							* (sampleBits / 8), true);
					offset += 4;
					// 快数据调整数 采样一次占用字节数 单声道×每样本的数据位数/8 
					data.setUint16(offset, channelCount * (sampleBits / 8),
							true);
					offset += 2;
					// 每样本数据位数 
					data.setUint16(offset, sampleBits, true);
					offset += 2;
					// 数据标识符 
					writeString('data');
					offset += 4;
					// 采样数据总数,即数据总大小-44 
					data.setUint32(offset, dataLength, true);
					offset += 4;
					// 写入采样数据 
					if (sampleBits === 8) {
						for (var i = 0; i < bytes.length; i++, offset++) {
							var s = Math.max(-1, Math.min(1, bytes[i]));
							var val = s < 0 ? s * 0x8000 : s * 0x7FFF;
							val = parseInt(255 / (65535 / (val + 32768)));
							data.setInt8(offset, val, true);
						}
					} else {
						for (var i = 0; i < bytes.length; i++, offset += 2) {
							var s = Math.max(-1, Math.min(1, bytes[i]));
							data.setInt16(offset, s < 0 ? s * 0x8000
									: s * 0x7FFF, true);
						}
					}

					return new Blob([ data ], {
						type : 'audio/wav'
					});
				}
			};

			this.start = function() {
				audioInput.connect(recorder);
				recorder.connect(context.destination);
			}

			this.stop = function() {
				recorder.disconnect();
			}

			this.getBlob = function() {
				return audioData.encodeWAV();
			}

			this.clear = function() {
				audioData.clear();
			}

			recorder.onaudioprocess = function(e) {
				audioData.input(e.inputBuffer.getChannelData(0));
			}
		};

		var socket = io('http://' + params.serverIP + ':5001', {
			'force new connection' : true
		});
		socket.on('connect', function() {
			console.log('connect');
		});
		socket.on('zhibo', function(data) {
			console.log(data);
			var audio = document.getElementById('a');
			audio.src = window.URL.createObjectURL(getBlob(data));
			audio.play();
		});

		document.getElementById('micBtn').onclick = function() {
			this.disabled = true;
			var audio = document.getElementById('a');
			audio.play();
		}

		navigator.getUserMedia = navigator.getUserMedia
				|| navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

		if (!navigator.getUserMedia) {
			console.log('该浏览器不支持getUserMedia');
			params.sendBtn.style.display = 'none';
			params.sayBtn.style.display = 'none';
			return '';
		}

		navigator.getUserMedia({
			audio : true,
			video : false
		}, function(stream) {
			var gRecorder = new SRecorder(stream);

			params.sendBtn.onclick = function() {
				socket.emit('zhibo', gRecorder.getBlob());
				gRecorder.clear();
				gRecorder.stop();
			}

			params.sayBtn.onclick = function() {
				gRecorder.start();
			}

		}, function(err) {
			console.log(err);
		});
	})();
</script>
</html>