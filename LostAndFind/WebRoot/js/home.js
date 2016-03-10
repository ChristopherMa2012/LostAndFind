$(function(){
	slidr.create('slidr-img', {
	  transition: 'linear',
	  timing: { 'cube': '0.5s ease-in' },
	}).add('h', ['one', 'two', 'three', 'one']).start().auto(5000,"right","one");
})