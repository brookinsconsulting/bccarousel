Slide = function(ele, options) {
	this.ele = ele;
	// merge options
	for (var prop in options) {
		this.options[prop] = options[prop];
	}
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
 	bc_namespace_slide = this;
	this.interval = setInterval('bc_namespace_slide.doSlide()', this.options.delay); 
}
// dir = direction, dist = distance
Slide.prototype.options =  {
			dir: 'left', // left right up down
			dist: 100,
			step: 2,
			delay: 100,
			onfinish: false
}

Slide.prototype.doSlide = function() {
	clearInterval(this.interval);
	// if we've travelled as much as we're supposed to, finish up
	if (this.dist_travelled>=this.options.dist) {
		if (this.dist_travelled>this.options.dist ) {
			var adjust = this.dist_travelled - this.options.dist;
			if (this.dist < 0) {
				this.modifyMargin(adjust);
			} else {
				this.modifyMargin(-(adjust));
			}
		}
		if (this.options.onfinish) {
			this.options.onfinish(this.ele);
		}
	} else {
		if (!this.ele.style.marginLeft) {
			this.ele.style.marginLeft = "0px";
		}
		
		if (!this.ele.style.marginTop) {
			this.ele.style.marginTop = "0px";
		}
		this.modifyMargin(this.step);
		this.dist_travelled += this.options.step;
 		bc_namespace_slide  = this;
		this.interval = setInterval('bc_namespace_slide.doSlide()', this.options.delay);
	}
}

Slide.prototype.modifyMargin = function(amt) {
	if (this.axis == 'x') {
		this.ele.style.marginLeft = (parseInt(this.ele.style.marginLeft) + amt)+"px";
	} else {
		this.ele.style.marginTop = (parseInt(this.ele.style.marginTop) + amt) + "px";
	}
}

Carousel = function () {
	return {
		is_running: false,
		auto_play: false,
		current_item_cb: false, // called when an animation is finished, use to set the states of your prev/next buttons
		current_direction: '', // set when an animation is running, previous or next
		init: function(item_count, items_to_show, auto_play, auto_play_delay, current_item_cb,  slide_step, slide_speed) {
			if (typeof(items_to_show) == "undefined") {
				this.items_to_show = 1;
			} else {
				this.items_to_show = items_to_show;
			}
			if (typeof(auto_play) != "undefined" && auto_play) {
				this.auto_play = auto_play;
				this.auto_play_delay = auto_play_delay;
				bc_carousel_namespace = this;
				this.auto_play_interval = setInterval('bc_carousel_namespace.showNext()', auto_play_delay);
			}
			if (typeof(current_item_cb) != "undefined") {
				this.current_item_cb = current_item_cb;	
			}
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
			this.container_width = Math.floor(parseInt(document.getElementById('carouselContainer').offsetWidth) / items_to_show);
			// adjust the carousel inner width a bit to make all the elements show up
			document.getElementById('carouselInner').style.width = (parseInt(document.getElementById('carouselContainer').offsetWidth) * (item_count+1)) + "px";
			document.getElementById('carouselInner').style.visibility = "visible";
			this.current_focus = 1;
			this.current_element = document.getElementById('carousel_1');	
			if (Carousel.current_item_cb) {
				Carousel.current_item_cb();
			}
		},
		showPrevious: function() {
			// autoplay
			if (typeof(this.auto_play_interval) != "undefined") {
				clearInterval(this.auto_play_interval);
			}
			if (this.auto_play) {
				bc_carousel_namespace = this;
				this.auto_play_interval = setInterval('bc_carousel_namespace.showNext()', this.auto_play_delay);
			}
			if (this.is_running || this.current_focus <= 1) {
				return;
			}
			var inner = document.getElementById('carouselInner');
			this.current_direction = 'previous';
			this.is_running = true;
			new Slide(inner, {dir: 'left', dist: this.container_width, step: this.slide_step, delay: this.slide_speed, onfinish: Carousel.animOnFinish});
		},
		
		showNext: function() {
			// autoplay
			if (typeof(this.auto_play_interval) != "undefined") {
				clearInterval(this.auto_play_interval);
			}
			if (this.auto_play) {
				bc_carousel_namespace = this;
				this.auto_play_interval = setInterval('bc_carousel_namespace.showNext()', this.auto_play_delay);
			}
			this.last_auto_play = this.auto_play;
			if (this.is_running || this.current_focus >= this.item_count) {
				this.auto_play = false;
				return;
			}
			var inner = document.getElementById('carouselInner');
			this.current_direction = 'next';
			this.is_running = true;
			new Slide(inner, {dir: 'right', dist: this.container_width, step: this.slide_step, delay:this.slide_speed, onfinish: Carousel.animOnFinish});
		},
		animOnFinish: function(ele) {
			Carousel.is_running = false;
			if (Carousel.current_direction == 'next') {
				Carousel.current_focus++;
			} else {
				Carousel.current_focus--;
			}
			if (Carousel.current_item_cb) {
				Carousel.current_item_cb();
			}
		}
		
	}
}()