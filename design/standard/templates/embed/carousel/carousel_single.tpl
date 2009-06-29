{**
 * File containing the feature_scroller_singleh template
 *
 * @package stdl
 * @version //autogentag//
 * @copyright Copyright (C) 2009 Brookins Consulting. All rights reserved.
 * @license GPL v2 (or later)
 *}
<style type="text/css">
{literal}
.carouselContainer_single {
	margin:0px;
	padding:0px;
	width: 208px !important;
	max-width: 208px;
	overflow: hidden;
}
.carouselInner_single {
	margin:0px;
	padding:0px;
	width: 100%;
	height: 100%;
	visibility: hidden;
}
.bc_carousel_single {
	/* ie hack for inline blocks*/
	display:-moz-inline-stack;
	display:inline-block;
	zoom:1;
	*display:inline;
	
	margin:0px;
	padding:0px;
	text-align: center;
	width: 208px !important;
	max-width: 208px;
	vertical-align: top;
}
.bc_carousel_single img {
	display: block;
	margin: 0px auto;
}
h2.carousel_header_single {
	font-family: Arial, Verdana, sans-serif;
	font-size: 16px;
	font-weight: normal;
	color: #602020;
}
.carousel_title_single {
	font-weight: bold;
	font-family: Arial, Verdana, sans-serif;
        font-size: 0.8em; // 11px;
	color: #156C99;
        padding: 2px 8px;
	font-weight:normal;
}
.prevBtn_single, .nextBtn_single {
	cursor: pointer;
	position: absolute;
	margin-top: 50px;
}
.prevBtn_single {
}
.nextBtn_single {
	margin-left: 174px;
}
.jcarousel-container {
    position: relative;
}

.jcarousel-clip {
    z-index: 2;
    padding: 0;
    margin: 0;
    overflow: hidden;
    position: relative;
}

.jcarousel-list {
    z-index: 1;
    overflow: hidden;
    position: relative;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
}

.jcarousel-list li,
.jcarousel-item {
    float: left;
    list-style: none;
    /* We set the width/height explicitly. No width/height causes infinite loops. */
    width: 142px;
    height: 207px;
}
.jcarousel-next {
    z-index: 3;
    display: none;
}

.jcarousel-prev {
    z-index: 3;
    display: none;
}
.jcarousel-skin-single .jcarousel-container {
    margin-left: -12px;
}

.jcarousel-skin-single .jcarousel-container-horizontal {
    width: 143px;
    padding: 20px 40px;
}

.jcarousel-skin-single .jcarousel-container-vertical {
    width: 75px;
    height: 245px;
    padding: 20px 20px;
}

.jcarousel-skin-single .jcarousel-clip-horizontal {
    width:  142px;
    height: 300px;
}

.jcarousel-skin-single .jcarousel-clip-vertical {
    width: 142px;
    height: 197px;
}

.jcarousel-skin-single .jcarousel-item {
    width: 142px;
    height: 225px;
}

.jcarousel-skin-single .jcarousel-item-horizontal {
    margin-right: 10px;
}

.jcarousel-skin-single .jcarousel-item-vertical {
    margin-bottom: 10px;
}

.jcarousel-skin-single .jcarousel-item-placeholder {
    background: #fff;
    color: #000;
}

.jcarousel-skin-single .jcarousel-next-horizontal {
    position: absolute;
    top: 93px;
    right: 5px;
    width: 27px;
    height: 24px;
    cursor: pointer;
    background: transparent url(/extension/stdl/design/stdl/images/carousel/nextbtn.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-horizontal:hover {
    background: transparent url(/extension/stdl/design/stdl/images/carousel/nextbtn-over.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-horizontal:active {
    background: transparent url(/extension/stdl/design/stdl/images/carousel/nextbtn-over.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-disabled-horizontal,
.jcarousel-skin-single .jcarousel-next-disabled-horizontal:hover,
.jcarousel-skin-single .jcarousel-next-disabled-horizontal:active {
    cursor: default;
    background: transparent url(/extension/stdl/design/stdl/images/carousel/nextbtn-over.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-horizontal {
    position: absolute;
    top: 93px;
    left: 5px;
    width: 27px;
    height: 24px;
    cursor: pointer;
    background: transparent url(/extension/stdl/design/stdl/images/carousel/prevbtn.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-horizontal:hover {
    background: transparent url(/extension/stdl/design/stdl/images/carousel/prevbtn-over.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-horizontal:active {
    background: transparent url(/extension/stdl/design/stdl/images/carousel/prevbtn-over.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-disabled-horizontal,
.jcarousel-skin-single .jcarousel-prev-disabled-horizontal:hover,
.jcarousel-skin-single .jcarousel-prev-disabled-horizontal:active {
    cursor: default;
    background: transparent url(/extension/stdl/design/stdl/images/carousel/prevbtn-over.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-vertical {
    position: absolute;
    bottom: 5px;
    left: 43px;
    width: 32px;
    height: 32px;
    cursor: pointer;
    background: transparent url(/extension/stdl/design/stdl/images/carousel/next-vertical.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-vertical:hover {
    background-position: 0 -32px;
}

.jcarousel-skin-single .jcarousel-next-vertical:active {
    background-position: 0 -64px;
}

.jcarousel-skin-single .jcarousel-next-disabled-vertical,
.jcarousel-skin-single .jcarousel-next-disabled-vertical:hover,
.jcarousel-skin-single .jcarousel-next-disabled-vertical:active {
    cursor: default;
    background-position: 0 -96px;
}

.jcarousel-skin-single .jcarousel-prev-vertical {
    position: absolute;
    top: 5px;
    left: 43px;
    width: 32px;
    height: 32px;
    cursor: pointer;
    background: transparent url(/extension/stdl/design/stdl/images/carousel/prev-vertical.png) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-vertical:hover {
    background-position: 0 -32px;
}

.jcarousel-skin-single .jcarousel-prev-vertical:active {
    background-position: 0 -64px;
}

.jcarousel-skin-single .jcarousel-prev-disabled-vertical,
.jcarousel-skin-single .jcarousel-prev-disabled-vertical:hover,
.jcarousel-skin-single .jcarousel-prev-disabled-vertical:active {
    cursor: default;
    background-position: 0 -96px;
}
.jcarousel-skin-single li img {
    width: 142px;
    height: 187px;
}
.jcarousel-skin-single li h3 {
    position: absolute;
    margin-top: 197px;
    font-weight: bold;
    font-family: Arial, Verdana, sans-serif;
    font-size: 0.8em; 
    color: #156C99;
    padding: 2px 8px;
    font-weight:normal;
   

}
{/literal}
</style>

<div class="feature_scroller_single_wrapper">

<h1>{$object.name|wash()}</h1>
{if $object.data_map.description.has_content}<p>{$object.data_map.description.value}</p>{/if}

    {def $children = array()
         $limit = 0
         $offset = 0}

    {if is_set( $object_parameters.limit )}
        {set $limit = $object_parameters.limit}
    {/if}

    {if is_set( $object_parameters.offset )}
        {set $offset = $object_parameters.offset}
    {/if}
    {set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                               'limit', $limit,
                                               'offset', $offset,
                                               'sort_by', $object.main_node.sort_array,
					       'class_filter_type', 'exclude',
					       'class_filter_array', array( 'sides' ) ) ) }
    {def $childrenCount=$children|count()}

    {if $children|count()|gt( 0 )}
<script language="Javascript" type="text/javascript">
{literal}
// helper function, modify to handle disabling prev/next buttons
/*
function preloadArrowImages() {
	var img= new Image(); 
    img.src="/extension/stdl/design/stdl/images/carousel/nextbtn-over.png"; 
	img = new Image(); 
    img.src="/extension/stdl/design/stdl/images/carousel/nextbtn-disabled.png"; 
	img = new Image(); 
    img.src="/extension/stdl/design/stdl/images/carousel/prevbtn-over.png"; 
	img = new Image(); 
    img.src="/extension/stdl/design/stdl/images/carousel/prevbtn-disabled.png"; 
}
preloadArrowImages();
*/
{/literal}
{*{literal}
/*
DOMReady(function() {
{/literal}
	Carousel.init({$childrenCount}, 1, {if $object.data_map.autoscroll.value|eq( '1' )}true{else}false{/if}, {if $object.data_map.autoscroll_hold_time.has_content|eq( 'true' )}{$object.data_map.autoscroll_hold_time.value}{else}3000{/if}, disablePrevOrNext, 20, 50);
{literal}
	addEvent(elm("prevBtn"), "click", function() { Carousel.auto_play = false; Carousel.showPrevious(); });
	addEvent(elm("nextBtn"), "click", function() { Carousel.auto_play = false; Carousel.showNext(); });
	addEvent(elm("prevBtn"), "mouseover", function() { if (!this.disabled) this.src='/extension/stdl/design/stdl/images/carousel/prevbtn-over.png'; });
	addEvent(elm("prevBtn"), "mouseout", function() { if (!this.disabled) this.src='/extension/stdl/design/stdl/images/carousel/prevbtn.png'; });
	addEvent(elm("nextBtn"), "mouseover", function() { if (!this.disabled) this.src='/extension/stdl/design/stdl/images/carousel/nextbtn-over.png'; });
	addEvent(elm("nextBtn"), "mouseout", function() { if (!this.disabled) this.src='/extension/stdl/design/stdl/images/carousel/nextbtn.png'; });
});*/
{/literal}*}
{literal}
jQuery(document).ready(function() {
    {/literal}
    jQuery("#carouselSingle{$object.main_node_id}").jcarousel({literal}{scroll:1}{/literal});
    {literal}
    });
{/literal}
</script>
{def $child=0
     $child_image_url=''
     $child_item_name=''
     $child_item_url=''
     $child_item_link=0
     $child_item_link_open=''
     $child_item_link_close='</a>'
}
{def $maximum_height_filters=ezini( 'scroller_image', 'Filters', 'image.ini' )}
{def $maximum_height_reversed=$maximum_height_filters[0]|reverse()|explode(';')}
{def $maximum_height=$maximum_height_reversed[0]|reverse()}

{* def $child_item_link=''}{def $child_item_link_open=''}{def $child_item_link_close='' *}


{*{if gt($childrenCount,1)}{/if}*}
 <ul id="carouselSingle{$object.main_node_id}" class="jcarousel-skin-single">
{for 0 to sum($childrenCount,-1) as $counter}{* <div style="display: none;"> *}
    {set $child=$children.$counter}
    {if $child.class_identifier|eq( 'a_featured_item' )}
        {if $child.data_map.promo_pic.has_content}
            {set $child_image_url=$child.data_map.promo_pic.value.scroller_image.url}
        {elseif $child.data_map.picurl.has_content}
            {set $child_image_url=$child.data_map.picurl.content}
        {elseif $child.data_map.isbn.has_content}
            {set $child_image_url=concat(ezini('SiteVariables','ItemPictureURLPre','content.ini'), $child.data_map.isbn.value, ezini('SiteVariables','ItemPictureURLPost','content.ini'))}
        {else}
            {set $child_image_url=''}
        {/if}
        {if $child.data_map.internal_url.has_content}
            {set $child_item_link=$child.data_map.internal_url.content.main_node.url_alias}
        {elseif $child.data_map.item_url.has_content}
            {set $child_item_link=$child.data_map.item_url.content}{*Get full URL link in full format without single or double quotes*}
        {elseif $child.data_map.isbn.has_content}
            {set $child_item_link=concat(ezini('SiteVariables','ISBNURLPre','content.ini'), $child.data_map.isbn.content, ezini('SiteVariables','ISBNURLPost','content.ini'))}
        {else}
            {set $child_item_link = ''}
        {/if}
        {set $child_item_name=$child.data_map.name.value}
    {elseif $child.class_identifier|eq( 'one_url_link' )}
        {if is_unset($user_is_external)}
            {def $user_ip = server( 'remote_addr' )}
            {def $proxy_ip_list = ezini( 'SiteVariables', 'ProxyIPList', 'content.ini' )}
            {def $user_is_external = true}
            {foreach $proxy_ip_list as $proxy_ip}
                {if $user_ip|begins_with($proxy_ip)}
                    {set $user_is_external = false}
                    {break}
                {/if}
            {/foreach}
        {/if}
        {if $child.data_map.internal_url.has_content}
            {set $child_item_link=$child.data_map.internal_url.content.main_node.url_alias}
        {elseif $child.data_map.item_url.has_content}
            {set $child_item_link=$child.data_map.item_url.content}{*Get full URL link in full format without single or double quotes*}
            {if is_unset($url_proxy)}
                {def $url_proxy=ezini('SiteVariables','ProxySite','content.ini')|trim("'")}{*Get Proxy URL from ini settings and trim quotes*}
            {/if}
            {if $child.data_map.use_proxy.content}
                {set $child_item_link=concat($url_proxy,$child_item_link)}
            {elseif $user_is_external}
                {if $child.data_map.internal_only.content}
                    {set $no_link = true}
                {elseif $child.data_map.external_url.has_content}
                    {set $child_item_link=$child.data_map.external_url.content}
                {/if}            
            {/if}
        {else}
            {set $child_item_link = ''}
        {/if}
        {if is_set($child.data_map.picture.value.scroller_image.url)}{set $child_image_url=$child.data_map.picture.value.scroller_image.url}{/if}
        {set $child_item_name=$child.data_map.name.value}
    {/if}
    {if ne('', $child_item_link)}
        {set $child_item_link_open=concat('<a href=', $child_item_link|ezurl(), '>')}
        {set $child_item_link_close='</a>'}
    {/if}
{*    </div> *}
{* <!-- New Structure

 <ul id="mycarousel" class="jcarousel-skin-single">
    <li><img src="http://static.flickr.com/66/199481236_dc98b5abb3_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/75/199481072_b4a0d09597_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/57/199481087_33ae73a8de_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/77/199481108_4359e6b971_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/58/199481143_3c148d9dd3_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/72/199481203_ad4cdcf109_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/58/199481218_264ce20da0_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/69/199481255_fdfe885f87_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/60/199480111_87d4cb3e38_s.jpg" width="142" height="187" alt="" /></li>
    <li><img src="http://static.flickr.com/70/229228324_08223b70fa_s.jpg" width="142" height="187" alt="" /></li>
  </ul>
--> *}
<li>{$child_item_link_open}{if ne($child_image_url, '')}<img src={$child_image_url|ezurl()}{if and(is_set($child.data_map.picheight), gt(min($child.data_map.picheight.content, $maximum_height), 0))} height="{min($child.data_map.picheight.content, $maximum_height)}"{/if}{if and(is_set($child.data_map.picwidth), gt($child.data_map.picwidth.content, 0), gt($maximum_height, $child.data_map.picheight.content))} width="{$child.data_map.picwidth.content}"{/if} />{$child_item_link_close}{/if}{if $object.data_map.show_titles.value|eq('1')}<div class="carousel_title_single">{$child_item_link_open}{$child_item_name}{$child_item_link_close}</div>{/if}</li>
{* <div class="bc_carousel_single">{$child_item_link_open}{if ne($child_image_url, '')}<img src={$child_image_url|ezurl()}{if and(is_set($child.data_map.picheight), gt(min($child.data_map.picheight.content, $maximum_height), 0))} height="{min($child.data_map.picheight.content, $maximum_height)}"{/if}{if and(is_set($child.data_map.picwidth), gt($child.data_map.picwidth.content, 0), gt($maximum_height, $child.data_map.picheight.content))} width="{$child.data_map.picwidth.content}"{/if} />{$child_item_link_close}{/if}{if $object.data_map.show_titles.value|eq('1')}<div class="carousel_title_single">{$child_item_link_open}{$child_item_name}{$child_item_link_close}</div>{/if}</div> *}
{/for}
</ul>

	{* if gt($childrenCount,1)}</div><!--end feature_scroller_single-->{/if *}
{else}
        <p>Sorry, no featured items available</p>
{/if}

</div><!--end blogroll-->
{* <!--end carouselInner-->	</div>
</div><!--end carouselContainer_single-->
</div><!--end feature_scroller_single--> *}
