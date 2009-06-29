{**
 * File containing the feature_scroller_singleh template
 *
 * @package bccarousel
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
    // width: 143px;
    width: 167px;
    padding: 20px 40px;
}

.jcarousel-skin-single .jcarousel-container-vertical {
    width: 75px;
    height: 245px;
    padding: 20px 20px;
}

.jcarousel-skin-single .jcarousel-clip-horizontal {
    // width:  142px;
    width:166px;
    // height: 300px;
}

.jcarousel-skin-single .jcarousel-clip-vertical {
    // width: 142px;
    width:166px;
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
    background: transparent url({/literal}{"carousel/nextbtn.png"|ezimage('no')}{literal}) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-horizontal:hover {
    background: transparent url({/literal}{"carousel/nextbtn-over.png"|ezimage('no')}{literal}) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-horizontal:active {
    background: transparent url({/literal}{"carousel/nextbtn-over.png"|ezimage('no')}{literal}) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-disabled-horizontal,
.jcarousel-skin-single .jcarousel-next-disabled-horizontal:hover,
.jcarousel-skin-single .jcarousel-next-disabled-horizontal:active {
    cursor: default;
    background: transparent url({/literal}{"carousel/nextbtn-over.png"|ezimage('no')}{literal}) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-horizontal {
    position: absolute;
    top: 93px;
    left: 5px;
    width: 27px;
    height: 24px;
    cursor: pointer;
    background: transparent url({/literal}{"carousel/prevbtn.png"|ezimage('no')}{literal}) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-horizontal:hover {
    background: transparent url({/literal}{"carousel/prevbtn-over.png"|ezimage('no')}{literal}) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-horizontal:active {
    background: transparent url({/literal}{"carousel/prevbtn-over.png"|ezimage('no')}{literal}) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-prev-disabled-horizontal,
.jcarousel-skin-single .jcarousel-prev-disabled-horizontal:hover,
.jcarousel-skin-single .jcarousel-prev-disabled-horizontal:active {
    cursor: default;
    background: transparent url({/literal}{"carousel/prevbtn-over.png"|ezimage('no')}{literal}) no-repeat 0 0;
}

.jcarousel-skin-single .jcarousel-next-vertical {
    position: absolute;
    bottom: 5px;
    left: 43px;
    width: 32px;
    height: 32px;
    cursor: pointer;
    background: transparent url({/literal}{"carousel/next-vertical.png"|ezimage('no')}{literal}) no-repeat 0 0;
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
    background: transparent url({/literal}{"carousel/prev-vertical.png"|ezimage('no')}{literal}) no-repeat 0 0;
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
.jcarousel-skin-single ul li {
    background-image: none;
}
{/literal}
</style>
<div class="carousel_single_wrapper">
<h1>{$object.name|wash()}</h1>
{* if $object.data_map.summary.has_content}<p>{$object.data_map.summary.value}</p>{/if *}
{if $object.data_map.description.has_content}<p>{$object.data_map.description.value}</p>{/if}
{def $children = array()
     $limit = 0
     $offset = 0}
{if is_set( $object_parameters.limit )}{set $limit = $object_parameters.limit}{/if}
{if is_set( $object_parameters.offset )}{set $offset = $object_parameters.offset}{/if}
{set $children=fetch( content, list, hash( 'parent_node_id', $object.main_node_id, 
                                           'limit', $limit,
                                           'offset', $offset,
                                           'sort_by', $object.main_node.sort_array,
					   'class_filter_type', 'exclude',
					   'class_filter_array', array( 'sides' ) ) ) }
{def $childrenCount=$children|count()}
{if $children|count()|gt( 0 )}
<script language="Javascript" type="text/javascript">{* // helper function, modify to handle disabling prev/next buttons *}{*
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
*}{literal}
jQuery(document).ready(function() {
    {/literal}
    jQuery("#carouselSingle{$object.main_node_id}").jcarousel({literal}{scroll:1}{/literal});
    {literal}
    });
{/literal}
</script>
{def $child=0
     $child_image=''
     $child_image_url=''
     $child_item_name=''
     $child_item_url=''
     $child_item_link=0
     $child_item_link_open=''
     $child_item_link_close=''
     $child_item_image_class='carousel_single'
     $child_item_class_name=concat( 'carouselSingle', $object.main_node_id )
}
{def $maximum_height_filters=ezini( $child_item_image_class, 'Filters', 'image.ini' )}
{def $maximum_height_reversed=$maximum_height_filters[0]|reverse()|explode(';')}
{def $maximum_height=$maximum_height_reversed[0]|reverse()}

{* def $child_item_link=''}{def $child_item_link_open=''}{def $child_item_link_close='' *}
{* if $children|count()|gt( 0 ) *}

{if gt($childrenCount,1)}
 <ul id="carouselSingle{$object.main_node_id}" class="jcarousel-skin-single">
{for 0 to sum($childrenCount,-1) as $counter}
    {set $child=$children.$counter}
    {if $child.class_identifier|eq( 'article' )}
        {set $child_item_name=$child.name}
        {set $child_item_link=$child.url}
        {if $child.data_map.image.has_content}
            {set $child_image=$child.data_map.image.value.$child_item_image_class}
            {set $child_image_url=concat( '/ezpublish/', $child_image.url )}
        {else}
            {set $child_image_url=''}
        {/if}
        {if ne('', $child_item_link)}
            {set $child_item_link_open=concat('<a href=', $child_item_link|ezurl(), '>')}
            {set $child_item_link_close='</a>'}
        {/if}

<li>{$child_item_link_open}{if ne($child_image_url, '')}<img src="{$child_image_url}"{if and(is_set($child.data_map.picheight), gt(min($child.data_map.picheight.content, $maximum_height), 0))} height="{min($child.data_map.picheight.content, $maximum_height)}"{/if}{if and(is_set($child.data_map.picwidth), gt($child.data_map.picwidth.content, 0), gt($maximum_height, $child.data_map.picheight.content))} width="{$child.data_map.picwidth.content}"{/if} />{$child_item_link_close}{/if}{if $object.data_map.show_titles.value|eq('1')}<div class="carousel_title_single">{$child_item_link_open}{$child_item_name}{$child_item_link_close}</div>{/if}</li>

    {/if}
{/for}

</ul>
{/if}
{* if gt($childrenCount,1)}</div><!--end feature_scroller_single-->{/if *}
{else}
        <p>Sorry, no items are currently available</p>
{/if}
</div><!--end blogroll-->
{* <!--end carouselInner-->	</div>
</div><!--end carouselContainer_single-->
</div><!--end feature_scroller_single--> *}
