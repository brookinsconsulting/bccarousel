<style type="text/css">
{literal}
.feature_scroller_single {
//	margin-bottom:60px;
}
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
	// text-align: center;
	width: 208px !important;
	max-width: 208px;
	vertical-align: top;
}
.bc_carousel_single img {
	display: block;
	margin: 0px auto;
	padding-right:7px;
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
	font-size: 11px;
	// padding: 2px 8px;
	text-align:left;
}
.prevBtn_single, .nextBtn_single {
	cursor: pointer;
	position: absolute;
	margin-top: 140px;
}
.prevBtn_single {
}
.nextBtn_single {
//	margin-left: 174px;
	margin-left: 194px;
}
{/literal}
</style>

<div class="feature_scroller_single">

<div class="header"><h1>{$object.name|wash()}</h1></div>
<div class="inner1"><div class="inner2">
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
{/literal}
{*{literal}
DOMReady(function() {
{/literal}
	Carousel.init({$childrenCount}, 1, {if $object.data_map.autoscroll.value|eq( '1' )}true{else}false{/if}, {if $object.data_map.autoscroll_hold_time.has_content|eq( 'true' )}{$object.data_map.autoscroll_hold_time.value}{else}12000{/if}, disablePrevOrNext, 20, 50);
{literal}
	addEvent(elm("prevBtn"), "click", function() { Carousel.auto_play = false; Carousel.showPrevious(); });
	addEvent(elm("nextBtn"), "click", function() { Carousel.auto_play = false; Carousel.showNext(); });
	addEvent(elm("prevBtn"), "mouseover", function() { if (!this.disabled) this.src='/extension/stdl/design/stdl/images/carousel/prevbtn-over.png'; });
	addEvent(elm("prevBtn"), "mouseout", function() { if (!this.disabled) this.src='/extension/stdl/design/stdl/images/carousel/prevbtn.png'; });
	addEvent(elm("nextBtn"), "mouseover", function() { if (!this.disabled) this.src='/extension/stdl/design/stdl/images/carousel/nextbtn-over.png'; });
	addEvent(elm("nextBtn"), "mouseout", function() { if (!this.disabled) this.src='/extension/stdl/design/stdl/images/carousel/nextbtn.png'; });
});
{/literal}*}
</script>
	{if gt($childrenCount,1)}<img id="prevBtn" class="prevBtn_single" src={"carousel/prevbtn.png"|ezimage()} /><img id="nextBtn" class="nextBtn_single" src={"carousel/nextbtn.png"|ezimage()} />
<div id="carouselContainer" class="carouselContainer_single">{/if}
	<div id="carouselInner" class="carouselInner_single" style="vertical-align: top;">

{def $child=0
     $child_image_url=0
     $child_item_link=0
     $child_item_link_text=0
     $child_item_name=0
     $child_item_url=0
     $child_item_description=0
}
{def $maximum_height_filters=ezini( 'scroller_image', 'Filters', 'image.ini' )}
{def $maximum_height_reversed=$maximum_height_filters[0]|reverse()|explode(';')}
{def $maximum_height=$maximum_height_reversed[0]|reverse()}
{set $child_item_description=''}
{set $child_item_link=''}
{set $child_item_link_text=''}
{def $child_item_link_open=''}
{def $child_item_link_close=''}
{for 0 to sum($childrenCount,-1) as $counter}<div style="display: none;">
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
            {set $child_item_link_text=$child.data_map.item_url.data_text}
        {elseif $child.data_map.isbn.has_content}
            {set $child_item_link=concat(ezini('SiteVariables','ISBNURLPre','content.ini'), $child.data_map.isbn.content, ezini('SiteVariables','ISBNURLPost','content.ini'))}
        {else}
            {set $child_item_link = ''}
            {set $child_item_link_text = ''}
        {/if}
        {set $child_item_name=$child.data_map.name.value}
        {set $child_item_description=$child.data_map.description.value}
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
            {set $child_item_link_text=$child.data_map.item_url.data_text}
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
	            {set $child_item_link_text = ''}
                {/if}            
            {/if}
        {else}
            {set $child_item_link = ''}
            {set $child_item_link_text = ''}
        {/if}
        {if is_set($child.data_map.picture.value.scroller_image.url)}{set $child_image_url=$child.data_map.picture.value.scroller_image.url}{/if}
        {set $child_item_name=$child.data_map.name.value}
        {set $child_item_description=$child.data_map.description.value}
    {/if}
    {if ne('', $child_item_link)}
        {set $child_item_link_open=concat('<a href=', $child_item_link|ezurl(), '>')}
        {set $child_item_link_close='</a>'}
    {/if}
    </div><div class="bc_carousel_single">{$child_item_link_open}{if ne($child_image_url, '')}<img class="image" alt="" src={$child_image_url|ezurl()}{if and(is_set($child.data_map.picheight), gt(min($child.data_map.picheight.content, $maximum_height), 0))} height="{min($child.data_map.picheight.content, $maximum_height)}"{/if}{if and(is_set($child.data_map.picwidth), gt($child.data_map.picwidth.content, 0), gt($maximum_height, $child.data_map.picheight.content))} width="{$child.data_map.picwidth.content}"{/if} align="left" />{/if}<span id="carouselInnerTitle" class="carousel_title_single">{$child_item_name}{$child_item_link_close}
<br />
{if $child_item_description|ne('')}
        {* Truncate output to a maximum of $counter characters, and make sure it ends with a whole word *}
        {def $counter=200}
        {def $text = $child_item_description|wash()}
        {while and(ne( $text|extract($counter,1) , " "), gt($counter, 0))}
                {set $counter =dec( $counter )}
        {/while}
<p id="carouselInnerDescription" class="carousel_description_single">
        {concat($text|extract( 0, $counter ), '...')}
&nbsp;<a href="{$child_item_link}">{$child_item_link_text}</a></p>
{/if}
</span></div>
{* $child.data_map.description|attribute(show,1) *}
{*Very important to have no spaces; otherwise the margins are off *}{/for}
<script language="Javascript" type="text/javascript">
    carousel_unique_namespace('carouselContainer', 'carouselInner', 'prevBtn', 'nextBtn');
    setTimeout("carousel_init("+carousel_unique_id+", {$childrenCount}, 1, {if $object.data_map.autoscroll.value|eq( '1' )}true{else}false{/if}, {if $object.data_map.autoscroll_hold_time.has_content|eq( 'true' )}{$object.data_map.autoscroll_hold_time.value}{else}3000{/if})", carousel_unique_id); 

</script>
{else}
	<p>Sorry, no featured items available</p>
    {/if}


	</div>
</div>
{*
<table>
                                <tr>
                                        <td class="prev">
                        <a href="#"><img src={"images/kids/prev_yellow.gif"|ezdesign} id="prevBtn" class="prevBtn_single" alt="Previous" /></a>
                        <a href="#"><< Previous</a>
			{if gt($childrenCount,1)}<img id="prevBtn" class="prevBtn_single" src={"carousel/prevbtn.png"|ezimage()} />{/if}
                                        </td>
                                        <td class="next">
                        <a href="#">Next >></a>
                        <a href="#"><img valign="absmiddle" id="nextBtn" class="nextBtn_single" src={"images/kids/next_yellow.gif"|ezdesign} alt="Next" /></a>
			{if gt($childrenCount,1)}<img id="nextBtn" class="nextBtn_single" src={"carousel/nextbtn.png"|ezimage()} />{/if}
                                        </td>
                                </tr>
                        </table>
*}

</div></div><!--end inner1-->

                <div class="footer"></div>

</div><!--end blogroll-->