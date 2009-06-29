{**
 * File containing the carousel template
 *
 * @package bccarousel
 * @version //autogentag//
 * @copyright Copyright (C) 2009 Brookins Consulting. All rights reserved.
 * @license GPL v2 (or later)
 *}<style type="text/css">
{literal}
.carouselContainer {
	margin:0px;
	padding:0px;
	width: 540px !important;
	max-width: 540px;
	overflow: hidden;
}
.carouselInner {
	margin:0px;
	padding:0px;
	visibility: hidden;
	width: 100%;
	height: 100%; 
}
.bc_carousel {
	/* ie hack for inline blocks*/
	display:-moz-inline-stack;
	display:inline-block;
	zoom:1;
	*display:inline;
	margin:0px;
	padding:0px;
	text-align: center;
	width: 180px !important;
	max-width: 180px;
	vertical-align: top;
}
.bc_carousel img {
	display: block;
	margin: 0px auto;
}
h2.carousel_header {
	font-family: Arial, Verdana, sans-serif;
	font-size: 16px;
	font-weight: normal;
	color: #602020;
}
.carousel_title {
	font-weight: bold;
	font-family: Arial, Verdana, sans-serif;
	font-size: 0.8em; // 11px;
	color: #156C99;
	padding: 2px 8px;
	font-weight:normal;
}
.prevBtn, .nextBtn {
	cursor: pointer;
	margin-top: 50px;
	z-index: 1000;
	position: absolute;
}
.nextBtn {
	margin-left: 514px;
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
.jcarousel-skin-3wide .jcarousel-container {
}

.jcarousel-skin-3wide .jcarousel-container-horizontal {
    // width: 450px;
    padding: 20px 40px;
}

.jcarousel-skin-3wide .jcarousel-container-vertical {
    width: 75px;
    height: 245px;
    padding: 20px 20px;
}

.jcarousel-skin-3wide .jcarousel-clip-horizontal {
//    width: 450px;
//    height: 300px;
}

.jcarousel-skin-3wide .jcarousel-clip-vertical {
    width: 142px;
    height: 197px;
}

.jcarousel-skin-3wide .jcarousel-item {
    width: 142px;
    height: 225px;
}

.jcarousel-skin-3wide .jcarousel-item-horizontal {
    margin-right: 10px;
}

.jcarousel-skin-3wide .jcarousel-item-vertical {
    margin-bottom: 10px;
}

.jcarousel-skin-3wide .jcarousel-item-placeholder {
    background: #fff;
    color: #000;
}

.jcarousel-skin-3wide .jcarousel-next-horizontal {
    position: absolute;
    top: 93px;
    right: 5px;
    width: 27px;
    height: 24px;
    cursor: pointer;
{/literal}
    background: transparent url({"carousel/nextbtn.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-next-horizontal:hover {
{/literal}
    background: transparent url({"carousel/nextbtn-over.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-next-horizontal:active {
{/literal}
    background: transparent url({"carousel/nextbtn-over.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-next-disabled-horizontal,
.jcarousel-skin-3wide .jcarousel-next-disabled-horizontal:hover,
.jcarousel-skin-3wide .jcarousel-next-disabled-horizontal:active {
    cursor: default;
{/literal}
    background: transparent url({"carousel/nextbtn-over.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-prev-horizontal {
    position: absolute;
    top: 93px;
    left: 5px;
    width: 27px;
    height: 24px;
    cursor: pointer;
{/literal}
    background: transparent url({"carousel/prevbtn.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-prev-horizontal:hover {
{/literal}
    background: transparent url({"carousel/prevbtn-over.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-prev-horizontal:active {
{/literal}
    background: transparent url({"carousel/prevbtn-over.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-prev-disabled-horizontal,
.jcarousel-skin-3wide .jcarousel-prev-disabled-horizontal:hover,
.jcarousel-skin-3wide .jcarousel-prev-disabled-horizontal:active {
    cursor: default;
{/literal}
    background: transparent url({"carousel/prevbtn-over.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-next-vertical {
    position: absolute;
    bottom: 5px;
    left: 43px;
    width: 32px;
    height: 32px;
    cursor: pointer;
{/literal}
    background: transparent url({"carousel/next-vertical.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-next-vertical:hover {
    background-position: 0 -32px;
}

.jcarousel-skin-3wide .jcarousel-next-vertical:active {
    background-position: 0 -64px;
}

.jcarousel-skin-3wide .jcarousel-next-disabled-vertical,
.jcarousel-skin-3wide .jcarousel-next-disabled-vertical:hover,
.jcarousel-skin-3wide .jcarousel-next-disabled-vertical:active {
    cursor: default;
    background-position: 0 -96px;
}

.jcarousel-skin-3wide .jcarousel-prev-vertical {
    position: absolute;
    top: 5px;
    left: 43px;
    width: 32px;
    height: 32px;
    cursor: pointer;
{/literal}
    background: transparent url({"carousel/prev-vertical.png"|ezimage('no')}) no-repeat 0 0;
{literal}
}

.jcarousel-skin-3wide .jcarousel-prev-vertical:hover {
    background-position: 0 -32px;
}

.jcarousel-skin-3wide .jcarousel-prev-vertical:active {
    background-position: 0 -64px;
}

.jcarousel-skin-3wide .jcarousel-prev-disabled-vertical,
.jcarousel-skin-3wide .jcarousel-prev-disabled-vertical:hover,
.jcarousel-skin-3wide .jcarousel-prev-disabled-vertical:active {
    cursor: default;
    background-position: 0 -96px;
}
.jcarousel-skin-3wide li img {
    width: 142px;
    height: 187px;
}
.jcarousel-skin-3wide li h3 {
    position: absolute;
    margin-top: 197px;
    font-weight: bold;
    font-family: Arial, Verdana, sans-serif;
    font-size: 0.8em; 
    color: #156C99;
    padding: 2px 8px;
    font-weight:normal;
   
}
.jcarousel-skin-3wide ul li {
    background-image: none;
}
{/literal}
</style>
<div class="carousel_wrapper" id="carousel_wrapper{$object.main_node_id}">
<h1>{$object.name|wash()}</h1>
{* if $object.data_map.summary.has_content}<p>{$object.data_map.summary.value}</p>{/if *}
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
{* $children|attribute(show,1) *}

{if $children|count()|gt( 0 )}
{def $child=0
     $child_image=''
     $child_image_url=''
     $child_item_link=''
     $child_item_name=''     
     $child_item_url=''
     $child_item_link=''
     $child_item_link_open=''
     $child_item_link_close=''
     $child_item_image_class='carousel'
     $child_item_ul_class_name=concat('carousel3wide',$object.main_node_id)
}
{def $maximum_height_filters=ezini( $child_item_image_class, 'Filters', 'image.ini' )}
{def $maximum_height_reversed=$maximum_height_filters[0]|reverse()|explode(';')}
{def $maximum_height=$maximum_height_reversed[0]|reverse()}
{* def $child_item_link=''}{def $child_item_link_open=''}{def $child_item_link_close='' *}

<ul id="{$child_item_ul_class_name}{* $object.main_node_id *}" class="jcarousel-skin-3wide">
{for 0 to sum($childrenCount,-1) as $counter}{set $child=$children.$counter}{if $child.class_identifier|eq( 'article' )}
        {set $child_item_name=$child.name}
        {set $child_item_name=$child.name}
	{if is_set( $child.url )}
	    {set $child_item_link=$child.url}
        {* elseif $child.data_map.internal_url.has_content}
            {set $child_item_link=$child.data_map.internal_url.content.main_node.url_alias}
        {elseif $child.data_map.item_url.has_content}
            {set $child_item_link=$child.data_map.item_url.content *}
        {else}
            {set $child_item_link = ''}
        {/if}
        {if $child.data_map.image.has_content}
            {set $child_image=$child.data_map.image.value.$child_item_image_class}
            {set $child_image_url=$child_image.url}
            {set $child_image_url=concat('/ezpublish/', $child_image.url)}
        {* elseif $child.data_map.picurl.has_content}
            {set $child_image_url=$child.data_map.picurl.content *}
        {else}
            {set $child_image_url=''}
        {/if}
{/if}
{if ne('', $child_item_link)}
   {set $child_item_link_open=concat('<a href=', $child_item_link|ezurl(), '>')}
   {set $child_item_link_close='</a>'}
{/if}

<li>{if $object.data_map.show_titles.value|eq('1')}<h3>{$child_item_link_open}{$child_item_name}{$child_item_link_close}</h3>{/if}{$child_item_link_open}{if ne($child_image_url, '')}<img alt="{$child.name}" src="{$child_image_url}" {if and(is_set($child.data_map.picheight), gt(min($child.data_map.picheight.content, $maximum_height), 0))} height="{min($child.data_map.picheight.content, $maximum_height)}"{/if}{if and(is_set($child.data_map.picwidth), gt($child.data_map.picwidth.content, 0), gt($maximum_height, $child.data_map.picheight.content))} width="{$child.data_map.picwidth.content}"{/if} />{$child_item_link_close}{/if}</li>
{/for}

</ul>
<script language="Javascript" type="text/javascript">
jQuery(document).ready(function() {literal}{{/literal}
jQuery("#{$child_item_ul_class_name}{* $object.main_node_id *}").jcarousel();
{literal}}{/literal});
    /*carousel_unique_namespace('carouselContainer{$object.main_node_id}', 'carouselInner', 'prevBtn', 'nextBtn');
    setTimeout("carousel_init("+carousel_unique_id+", {$childrenCount}, 3, {if $object.data_map.autoscroll.value|eq( '1' )}true{else}false{/if}, {if $object.data_map.autoscroll_hold_time.has_content|eq( 'true' )}{$object.data_map.autoscroll_hold_time.value}{else}3000{/if})", carousel_unique_id);*/
</script>
{else}
	<p>Sorry, no items are currently available.</p>
{/if}

{* DUPLICATED! *}

</div><!--end carousel_wrapper{$object.main_node_id}-->
