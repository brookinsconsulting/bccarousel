function Slide(carousel_unique_id, ele, options) {
	this.ele = ele;
	this.carousel_unique_id = carousel_unique_id;
	// merge options
    this.options = options;
	//for (var prop in this.options) {
	//	this.options[prop] = this.options[prop];
	//}
	this.dist_travelled = 0;
	if (this.options.dir == 'right') {
		this.axis = 'x';
		this.dist = -(this.options.dist);
		this.step = -(this.options.step);
	} else if (this.options.dir == 'up') {
		this.axis = 'y';
		this.dist = -(this.options.dist);
		this.step = -(this.options.step);
	} else if (this.options.dir == 'down') {
		this.axis = 'y'
		this.dist = this.options.dist;
		this.step = this.options.step;
	} else {
		this.axis = 'x';
		this.dist = this.options.dist;
		this.step = this.options.step;
	}

	this.interval = setInterval('thisSlide['+this.carousel_unique_id+'].doSlide()', this.options.delay);
    
    this.doSlide = function() {
    	clearInterval(this.interval);

    	// if we've travelled as much as we're supposed to, finish up
    	if (this.dist_travelled>=this.options.dist) {
    		if (this.dist_travelled>this.options.dist ) {            
    			this.adjust = this.dist_travelled - this.options.dist;
    			if (this.dist < 0) {
    				this.modifyMargin(this.adjust);
    			} else {
    				this.modifyMargin(-(this.adjust));
    			}
    		}
            thisCarousel[this.carousel_unique_id].animOnFinish();
    	}
        else {
    		if (!this.ele.style.marginLeft) {
    			this.ele.style.marginLeft = "0px";
    		}
    		
    		if (!this.ele.style.marginTop) {
    			this.ele.style.marginTop = "0px";
    		}
    		this.modifyMargin(this.step);
    		this.dist_travelled += this.options.step;
            
    		this.interval = setInterval('thisSlide['+this.carousel_unique_id+'].doSlide()', this.options.delay);
    	}
    };

    this.modifyMargin = function(amt) {

    	if (this.axis == 'x') {
    		this.ele.style.marginLeft = (parseInt(this.ele.style.marginLeft) + amt)+"px";
    	} else {
    		this.ele.style.marginTop = (parseInt(this.ele.style.marginTop) + amt) + "px";
    	}
    };
}
// dir = direction, dist = distance
//Slide.prototype.options =  {
//			dir: 'left', // left right up down
//			dist: 100,
//			step: 2,
//			delay: 100
//}



var carousel_unique_id;
thisCarousel = new Array();
thisSlide = new Array();

function carousel_unique_namespace(scroller_container_id, scroller_inner_id, prev_btn, next_btn) {

    if (typeof(carousel_unique_id) == "undefined") {
        carousel_unique_id = 0;
    }
    else {
        carousel_unique_id++;
    }

    this.scroller_inner_id = scroller_inner_id + '_' + carousel_unique_id;
    document.getElementById(scroller_inner_id).id = this.scroller_inner_id;
        
    this.scroller_container_id = scroller_container_id + '_' + carousel_unique_id;
    document.getElementById(scroller_container_id).id = this.scroller_container_id;
       
    this.prev_btn = prev_btn + '_' + carousel_unique_id;
    document.getElementById(prev_btn).id = this.prev_btn;
        
    this.next_btn = next_btn + '_' + carousel_unique_id;
    document.getElementById(next_btn).id = this.next_btn;
}

function carousel_init(carousel_unique_id, childrenCount, items_to_show, autoscroll, autoscroll_hold_time) {
    thisCarousel[carousel_unique_id] = new Carousel;
    thisCarousel[carousel_unique_id].init('carouselContainer_' + carousel_unique_id, 'carouselInner_' + carousel_unique_id, 'prevBtn_' + carousel_unique_id, 'nextBtn_' + carousel_unique_id, childrenCount, items_to_show, autoscroll, autoscroll_hold_time, 20, 50, thisCarousel[carousel_unique_id], carousel_unique_id);
}


function Carousel() {

    this.init = function(scroller_container_id, scroller_inner_id, prev_btn, next_btn, item_count, items_to_show, auto_play, auto_play_delay, slide_step, slide_speed, carousel_id, carousel_unique_id) {
        this.carousel_unique_id = carousel_unique_id;
        this.scroller_container_id = scroller_container_id;
        this.scroller_inner_id = scroller_inner_id;
        this.prev_btn = prev_btn;
        this.next_btn = next_btn;
        
        this.is_running = false;
        
        this.current_direction = ''; // set when an animation is running, previous or next
        
        addEvent(document.getElementById(this.prev_btn), "click", function() { carousel_id.auto_play = false; carousel_id.showPrevious(); });
        addEvent(document.getElementById(this.next_btn), "click", function() { carousel_id.auto_play = false; carousel_id.showNext(true); });
        addEvent(document.getElementById(this.prev_btn), "mouseover", function() { if ('black' != this.style.color) this.src='/extension/stdl/design/stdl/images/carousel/prevbtn-over.png'; });
        addEvent(document.getElementById(this.prev_btn), "mouseout", function() { if ('black' != this.style.color) this.src='/extension/stdl/design/stdl/images/carousel/prevbtn.png'; });
        addEvent(document.getElementById(this.next_btn), "mouseover", function() { if ('black' != this.style.color) this.src='/extension/stdl/design/stdl/images/carousel/nextbtn-over.png'; });
        addEvent(document.getElementById(this.next_btn), "mouseout", function() { if ('black' != this.style.color) this.src='/extension/stdl/design/stdl/images/carousel/nextbtn.png'; });

        if (typeof(items_to_show) == "undefined") {
            this.items_to_show = 1;
        } else {
            this.items_to_show = items_to_show;
        }

        this.auto_play = auto_play;
        this.auto_play_delay = auto_play_delay;
        this.auto_play_interval = setInterval("thisCarousel["+this.carousel_unique_id+"].showNext(false)", this.auto_play_delay);

        if (typeof(slide_speed) == "undefined" || !slide_speed) {
            this.slide_speed = 100;
        } else {
            this.slide_speed = slide_speed;
        }
        if (typeof(slide_step) == "undefined" || !slide_step) {
            this.slide_step = 20;
        } else {
            this.slide_step = slide_step;
        }
        
        this.item_count = item_count;
        
        this.container_width = Math.floor(parseInt(document.getElementById(this.scroller_container_id).offsetWidth) / this.items_to_show);

        // adjust the carousel inner width a bit to make all the elements show up
        document.getElementById(this.scroller_inner_id).style.width = (parseInt(document.getElementById(this.scroller_container_id).offsetWidth) * (this.item_count+1)) + "px";
        document.getElementById(this.scroller_inner_id).style.visibility = "visible";
        this.current_focus = 1;
        
        this.disablePrevOrNext();
        
        this.colour_value_r = 21;
        this.colour_value_g = 108;
        this.colour_value_b = 153;
        this.current_opacity = 100;
    };
    this.showPrevious = function() {
        // autoplay
        if (typeof(this.auto_play_interval) != "undefined") {
            clearInterval(this.auto_play_interval);
        }
        if (this.auto_play) {
            this.auto_play_interval = setInterval('thisCarousel['+this.carousel_unique_id+'].showNext(false)', this.auto_play_delay);
        }
        if (this.is_running || this.current_focus <= 1) {
            return;
        }
        this.inner = document.getElementById(this.scroller_inner_id);
        this.current_direction = 'previous';
        this.is_running = true;
        thisSlide[this.carousel_unique_id] = new Slide(this.carousel_unique_id, this.inner, {dir: 'left', dist: this.container_width, step: this.slide_step, delay: this.slide_speed});
    };

    this.restartBeginning = function(div_to_fade) {
        // Text color fade modified from http://www.albeesonline.com/blog/2008/09/25/javascript-fading-effect/
        // Image fade modified from Doug Plant at http://www.mugo.ca
               
        if (this.item_count <= this.items_to_show) {
            return;
        }
        
        clearTimeout(this.restart);
        var inner = document.getElementById(div_to_fade);
        this.carousel_a_tags = this.inner.getElementsByTagName("a");
        this.carousel_a_num = this.carousel_a_tags.length;
        this.carousel_img_tags = this.inner.getElementsByTagName("img");
        this.carousel_img_num = this.carousel_img_tags.length;
        this.carousel_span_tags = this.inner.getElementsByTagName("span");
        this.carousel_span_num = this.carousel_span_tags.length;
        this.carousel_p_tags = this.inner.getElementsByTagName("p");
        this.carousel_p_num = this.carousel_p_tags.length;
        this.carousel_div_tags = this.inner.getElementsByTagName("div");
        this.carousel_div_num = this.carousel_div_tags.length;
        
        if(((this.colour_value_r + this.colour_value_g + this.colour_value_b) < 765) || this.current_opacity > 0) { 
            this.colour_value_r = Math.min(255, this.colour_value_r + 10);
            this.colour_value_g = Math.min(255, this.colour_value_g + 10);
            this.colour_value_b = Math.min(255, this.colour_value_b + 10);
            this.current_opacity = Math.max(0, this.current_opacity - 5);
            
            for(i=0;i<this.carousel_a_num;i++) {
                this.carousel_a_tags[i].style.color="rgb("+this.colour_value_r+","+this.colour_value_g+","+this.colour_value_b+")";
            }
            for(i=0;i<this.carousel_img_num;i++) {
                this.carousel_img_tags[i].style.opacity = this.current_opacity / 100;
                this.carousel_img_tags[i].style.filter = "alpha(opacity=" + this.current_opacity + ")";
            }
            for(i=0;i<this.carousel_span_num;i++) {
                this.carousel_span_tags[i].style.opacity = this.current_opacity / 100;
                this.carousel_span_tags[i].style.filter = "alpha(opacity=" + this.current_opacity + ")";
            }
            for(i=0;i<this.carousel_p_num;i++) {
                this.carousel_p_tags[i].style.opacity = this.current_opacity / 100;
                this.carousel_p_tags[i].style.filter = "alpha(opacity=" + this.current_opacity + ")";
            }

            for(i=0;i<this.carousel_div_num;i++) {
                this.carousel_div_tags[i].style.opacity = this.current_opacity / 100;
                this.carousel_div_tags[i].style.filter = "alpha(opacity=" + this.current_opacity + ")";
            }
            this.car_timeout = setTimeout("thisCarousel["+this.carousel_unique_id+"].restartBeginning('" + div_to_fade + "', " + this.manual+ ")",50);
        }
        else {
            if (typeof(this.car_timeout) != "undefined") {
                clearTimeout(this.car_timeout);
                setTimeout("thisCarousel["+this.carousel_unique_id+"].restoreBeginning("+this.manual+")", 1000);
            }
        }
    };
    
    this.restoreBeginning = function() {
        document.getElementById(this.scroller_inner_id).style.marginLeft = '0px';
        for(i=0;i<this.carousel_a_num;i++) {
            this.carousel_a_tags[i].style.color="rgb(21, 108, 153)";
        }
        for(i=0;i<this.carousel_img_num;i++) {
            this.carousel_img_tags[i].style.opacity = 100;
            this.carousel_img_tags[i].style.filter = "alpha(opacity=100)";
        }
        for(i=0;i<this.carousel_span_num;i++) {
            this.carousel_span_tags[i].style.opacity = 100;
            this.carousel_span_tags[i].style.filter = "alpha(opacity=100)";
        }
        for(i=0;i<this.carousel_p_num;i++) {
            this.carousel_p_tags[i].style.opacity = 100;
            this.carousel_p_tags[i].style.filter = "alpha(opacity=100)";
        }
        for(i=0;i<this.carousel_div_num;i++) {
            this.carousel_div_tags[i].style.opacity = 100;
            this.carousel_div_tags[i].style.filter = "alpha(opacity=100)";
        }
        this.colour_value_r = 21;
        this.colour_value_g = 108;
        this.colour_value_b = 153;
        this.current_opacity = 100;
        this.animOnFinish(1);
        if (!this.manual) {
            this.auto_play = true;
            clearInterval(this.auto_play_interval);
            this.auto_play_interval = setInterval('thisCarousel['+this.carousel_unique_id+'].showNext(false)', this.auto_play_delay);
            //setTimeout("thisCarousel["+this.carousel_unique_id+"].showNext("+this.manual+")", this.auto_play_delay);
        }
    };
    
    this.showNext = function(manual) {
        if (typeof(manual) == "undefined") {
            manual = false;
        }
        this.manual = manual;

        if (this.current_focus >= (this.item_count - this.items_to_show + 1)) {
            document.getElementById(this.prev_btn).style.display='none';
            document.getElementById(this.next_btn).style.display='none';
            this.restartBeginning(this.scroller_inner_id);
        }
        // autoplay
        if (typeof(this.auto_play_interval) != "undefined") {
            clearInterval(this.auto_play_interval);
        }
        if (this.auto_play) {
            this.auto_play_interval = setInterval('thisCarousel['+this.carousel_unique_id+'].showNext('+this.manual+')', this.auto_play_delay);
        }
        
        if (this.is_running || this.current_focus >= (this.item_count - this.items_to_show + 1) ) {
            if (this.current_focus >= (this.item_count - this.items_to_show)) {
                this.auto_play = false;
            }
            return;
        }
        this.inner = document.getElementById(this.scroller_inner_id);
        this.current_direction = 'next';
        this.is_running = true;
        thisSlide[this.carousel_unique_id] = '';
        thisSlide[this.carousel_unique_id] = new Slide(this.carousel_unique_id, this.inner, {dir: 'right', dist: this.container_width, step: this.slide_step, delay:this.slide_speed});
    };
    
    this.animOnFinish = function(new_focus) {
        this.is_running = false;
        if (1 == new_focus) {
            this.current_focus = new_focus;
        }
        else if (this.current_direction == 'next') {
            this.current_focus++;
        } else {
            this.current_focus--;
        }

        this.disablePrevOrNext();

        if (!this.manual && this.current_focus >= (this.item_count - this.items_to_show + 1)) {
            this.restart = setTimeout("thisCarousel["+this.carousel_unique_id+"].restartBeginning('"+this.scroller_inner_id+"', "+this.manual+")", this.auto_play_delay);
        }
    };
    
    this.disablePrevOrNext = function() {
        this.previous_disabled = false;
        this.next_disabled = false;
        if (this.current_focus == 1) {
            //document.getElementById(this.prev_btn).disabled=true;
            document.getElementById(this.prev_btn).style.cursor="default";
            document.getElementById(this.prev_btn).style.display="none";
            document.getElementById(this.prev_btn).style.color = 'black';
            // document.getElementById(this.prev_btn).src= '/extension/stdl/design/stdl/images/carousel/prevbtn-restart.gif';
            this.previous_disabled = true;
        }
        else {
            document.getElementById(this.prev_btn).style.color = 'red';
        }
        // Don't want to show any blank spaces
        if (this.current_focus >= (this.item_count - this.items_to_show + 1) ) {
            document.getElementById(this.next_btn).src= '/extension/stdl/design/stdl/images/carousel/prevbtn-restart.gif';
            document.getElementById(this.next_btn).style.color = 'black';
            //document.getElementById(this.next_btn).style.cursor="default";
            //document.getElementById(this.next_btn).style.display="none";
            document.getElementById(this.next_btn).style.cursor="pointer";
            this.next_disabled = true;
        }
        else {
            document.getElementById(this.next_btn).style.color = 'red';
            document.getElementById(this.next_btn).src= '/extension/stdl/design/stdl/images/carousel/nextbtn.png';
        }
        if (!this.previous_disabled) {
            document.getElementById(this.prev_btn).src='/extension/stdl/design/stdl/images/carousel/prevbtn.png'; document.getElementById(this.prev_btn).style.display = '';
            document.getElementById(this.prev_btn).style.cursor="pointer";
        }
        if (!this.next_disabled) {
            document.getElementById(this.next_btn).src='/extension/stdl/design/stdl/images/carousel/nextbtn.png'; document.getElementById(this.next_btn).style.display = '';
            document.getElementById(this.next_btn).style.cursor="pointer";
        }
    }
}