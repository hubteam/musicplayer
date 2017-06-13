$(document).ready(function(){	
  var myPlaylist = new jPlayerPlaylist({
    jPlayer: "#jplayer_N",
    cssSelectorAncestor: "#jp_container_N"
  }, [
    
  ], {
	 timeupdate: function(event) {
		time = event.jPlayer.status.currentTime;
	 },
	 
    playlistOptions: {
      enableRemoveControls: true,
      //autoPlay: true
    },
    swfPath: "js/jPlayer",
    supplied: "webmv, ogv, m4v, oga, mp3",
    smoothPlayBar: true,
    keyEnabled: true,
    audioFullScreen: false
  });
  var i=0;
  var ss= new Array(); 
  $.okclick={
		startm:function(){
			var zfc=$("a").attr("value");
			//alert(zfc);
			var strs= new Array(); //定义一数组,存放歌曲信息 
			strs=zfc.split(","); //字符分割
        	var flag=0;
        	//ss[i]=strs[0];
			for(var j=0;j<=ss.length;j++){
				if (ss[j]==strs[0]){
					//alert(ss[j]);
					wz=j;
					flag=1;
					break;
				}else{
					ss[i++]=strs[0];
					break;
				}
			}
			if(flag){
				myPlaylist.play(wz);
			}else{
				myPlaylist.add({
				title:strs[0],
				artist:strs[1],
				mp3:strs[2], 
				lrc:strs[3]
				},true);
			}
		}
	};
    
  $(document).on($.jPlayer.event.pause, myPlaylist.cssSelector.jPlayer,  function(){
    $('.musicbar').removeClass('animate');
    $('.jp-play-me').removeClass('active');
    $('.jp-play-me').parent('li').removeClass('active');
  });

  $(document).on($.jPlayer.event.play, myPlaylist.cssSelector.jPlayer,  function(){
    $('.musicbar').addClass('animate');
  });

  $(document).on('click', '.jp-play-me', function(e){
    e && e.preventDefault();
    var $this = $(e.target);
    var i=$(this).index();
    if (!$this.is('a')) $this = $this.closest('a');

    $('.jp-play-me').not($this).removeClass('active');
    $('.jp-play-me').parent('li').not($this.parent('li')).removeClass('active');

    $this.toggleClass('active');
    $this.parent('li').toggleClass('active');
    if( !$this.hasClass('active') ){
      myPlaylist.pause();
    }else{
      //var i = Math.floor(Math.random() * (1 + 7 - 1));
      myPlaylist.play(i);
    }
    
  });
  
});