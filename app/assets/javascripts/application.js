// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs 
//= require jquery.ui.all
//= require jquery.jsPlumb-1.5.5-min.js
//= require scrollsync
//= require jquery.dragscrollable
//= require_self


var setZoom = function(z, el) {
    var p = [ "-webkit-", "-moz-", "-ms-", "-o-", "" ],
        s = "scale(" + z + ")";

    for (var i = 0; i < p.length; i++)
        el.css(p[i] + "transform", s);

    jsPlumb.setZoom(z);    
};
	
function getMaxNumericAttribute(attr){
	var values = []
	$(".node:not(.selected)").each(function(){
		var value = parseInt($(this).css(attr));
		values.push(value);	
	});
	values = values.filter(function(n){return n}); //elimina los NaN
	return  Math.max.apply( Math, values );
}



function resizeMainPane(){
	var width = getMaxNumericAttribute("left")+300; //Node width
	var height = getMaxNumericAttribute("top")+200; //Node height TODO scale %
	if ($(document).width() > width) width = $(document).width()-8;
	if ($(document).height() > width) width = $(document).height()-8; 
	$('#main').width(width);
	$('#main').height(height);
}

function resizeDraggerPane(){
	$('#dragger_pane').width($(window).width()-8);
	$('#dragger_pane').height($(window).height()-8);
}
		
$(document).ready(function() {
	
	$(window).resize(function(){
		resizeDraggerPane();
	});
			
	$(document).on("click", ".node", function(){
		if ($(this).hasClass("selected")){
			$(this).removeClass("selected");
		}else{
			$(".node").removeClass("selected");
			$(this).addClass("selected");
		}
	});
	
	$(document).on("change", "#zoom", function(){
		setZoom($(this).val(), $("#main"));
	});

	
	 nodes = jsPlumb.getSelector(".node");
     js_instance = jsPlumb.getInstance({
    	DragOptions : { cursor: "move", zIndex:2000 },
		EndpointStyles : [{fillStyle:"trasnparent" }],
		Endpoint : "Blank",
		PaintStyle : {
        	strokeStyle:"#ffffff",
        	lineWidth:2
    	},
    	dropOptions:{ 
	      drop:function(e, ui) { 
	        alert('drop!'); 
	      } 
	    },
    	ConnectionOverlays : [
			[ "Arrow", { location:1, 
                length:6,
                foldback:1} ]]
    });
    
    	
	$(document).bind("dragstop", function(info){		
		resizeMainPane();
		var max = getMaxNumericAttribute("z-index");
		if (max == -Infinity) max = $(".node").length; //si no habia valores en el array
		max = max + 1;  
		$(info.target).css("z-index", max);
	});
    		    
    js_instance.draggable(nodes);
	//jsPlumb.connect({source:"node_1", target:"node_2", scope:"main", anchor: ["Perimeter", {shape:"Rectangle"}]});// Set header viewport to follow viewport scroll on x axis
	$('#dragger_pane').scrollsync({targetSelector: '#dragger_pane', axis : 'x'});
	
	// Set drag scroll on first descendant of class dragger on both selected elements
	$('#dragger_pane').dragscrollable({dragSelector: '#main', acceptPropagatedEvent: false});
	
	resizeDraggerPane();

	
});

	 