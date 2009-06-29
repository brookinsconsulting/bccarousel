{**
 * File containing the feature_scroller_list template
 *
 * @package stdl
 * @version //autogentag//
 * @copyright Copyright (C) 2009 Brookins Consulting. All rights reserved.
 * @license GPL v2 (or later)
 *}<div id="blogroll">

<h1>{$object.name|wash()}</h1>
    {def $children = array()
         $limit = 3
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
    {if $children|count()}
        {if and(eq($object.class_identifier, 'feature_list'), $object.data_map.show_images.content|eq( '1' ))}
                {def $childcount = 1}
                {foreach $children as $child}
                    {if and(gt($childcount, 1), $object.data_map.show_images.content|eq( '1' ))}<hr />{/if}
                    {node_view_gui view=line content_node=$child}
                    {set $childcount = $childcount|inc()}
                {/foreach}
        {else}
            <ul class="class-feature-scroller-list">
                {foreach $children as $child}
                    {node_view_gui view=line content_node=$child}
                {/foreach}
            </ul>
        {/if}
    {/if}
</div><!--end blogroll-->