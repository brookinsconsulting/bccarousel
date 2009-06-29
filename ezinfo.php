<?php
class bccarouselInfo
{
    function info()
    {
        $BCCurrentYearString = date('Y');
        return array(
            'Name' => "<a href='http://projects.ez.no/bccarousel'>BC Carousel</a>",
            'Version' => "1.0.0",
            'Copyright' => "Copyright (C) 2008 - $BCCurrentYearString <a href='http://brookinsconsulting.com/'>Brookins Consulting</a>",
            'License' => "GNU General Public License v2.0 (or later)",
            'Author' => "Brookins Consulting",
            'Includes the following third-party software' => array( 'Name' => "<a href='http://sorgalla.com/jcarousel'>jCarousel</a> - Javascript Carousel",
                                                                    'Version' => '0.2.3',
                                                                    'Copyright' => 'Copyright (C) 2006 <a href="http://sorgalla.com/">Jan Sorgalla</a>',
                                                                    'License' => ' Dual licensed under the MIT and GPL licenses' )
        );
    }
}
?>