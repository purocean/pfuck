   �         +https://passport.qbao.com/css/new_table.css     %g��     %��              �      
     O K      Date   Sun, 28 Feb 2016 11:10:23 GMT   Content-Type   text/css   Vary   Accept-Encoding   Content-Encoding   gzip   Expires   Sun, 28 Feb 2016 12:03:01 GMT   Last-Modified   Wed, 09 Dec 2015 18:25:28 GMT   X-Cache   hit 
/*demotable*/
/*
 *  File:         demo_table.css
 *  CVS:          $Id$
 *  Description:  CSS descriptions for DataTables demo pages
 *  Author:       Allan Jardine
 *  Created:      Tue May 12 06:47:22 BST 2009
 *  Modified:     $Date$ by $Author$
 *  Language:     CSS
 *  Project:      DataTables
 *
 *  Copyright 2009 Allan Jardine. All Rights Reserved.
 *
 * ***************************************************************************
 * DESCRIPTION
 *
 * The styles given here are suitable for the demos that are used with the standard DataTables
 * distribution (see www.datatables.net). You will most likely wish to modify these styles to
 * meet the layout requirements of your site.
 *
 * Common issues:
 *   'full_numbers' pagination - I use an extra selector on the body tag to ensure that there is
 *     no conflict between the two pagination types. If you want to use full_numbers pagination
 *     ensure that you either have "example_alt_pagination" as a body class name, or better yet,
 *     modify that selector.
 *   Note that the path used for Images is relative. All images are by default located in
 *     ../images/ - relative to this CSS file.
 */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * DataTables features
 */

.dataTables_wrapper {
	position: relative;
	min-height: 302px;
	clear: both;
	_height: 302px;
	zoom: 1; /* Feeling sorry for IE */
}

.dataTables_processing {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 250px;
	height: 30px;
	margin-left: -125px;
	margin-top: -15px;
	padding: 14px 0 2px 0;
	border: 1px solid #ddd;
	text-align: center;
	color: #999;
	font-size: 14px;
	background-color: white;
}

.dataTables_length {
	width: 40%;
	float: left;
}

.dataTables_filter {
	width: 50%;
	float: right;
	text-align: right;
}

.dataTables_info {
	width: 60%;
	float: left;
}

.dataTables_paginate {
	width: 44px;
	* width: 50px;
	float: right;
	text-align: right;
}

/* Pagination nested */
.paginate_disabled_previous, .paginate_enabled_previous, .paginate_disabled_next, .paginate_enabled_next {
	height: 19px;
	width: 19px;
	margin-left: 3px;
	float: left;
}

.paginate_disabled_previous {
	background-image: url('../images/back_disabled.jpg');
}

.paginate_enabled_previous {
	background-image: url('../images/back_enabled.jpg');
}

.paginate_disabled_next {
	background-image: url('../images/forward_disabled.jpg');
}

.paginate_enabled_next {
	background-image: url('../images/forward_enabled.jpg');
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * DataTables display
 */
table.display {
	margin: 0 auto;
	clear: both;
	width: 100%;
	
	/* Note Firefox 3.5 and before have a bug with border-collapse
	 * ( https://bugzilla.mozilla.org/show%5Fbug.cgi?id=155955 ) 
	 * border-spacing: 0; is one possible option. Conditional-css.com is
	 * useful for this kind of thing
	 *
	 * Further note IE 6/7 has problems when calculating widths with border width.
	 * It subtracts one px relative to the other browsers from the first column, and
	 * adds one to the end...
	 *
	 * If you want that effect I'd suggest setting a border-top/left on th/td's and 
	 * then filling in the gaps with other borders.
	 */
}

table.display thead th {
	padding: 3px 18px 3px 10px;
	border-bottom: 1px solid black;
	font-weight: bold;
	cursor: pointer;
	* cursor: hand;
}

table.display tfoot th {
	padding: 3px 18px 3px 10px;
	border-top: 1px solid black;
	font-weight: bold;
}

table.display tr.heading2 td {
	border-bottom: 1px solid #aaa;
}

table.display td {
	padding: 3px 10px;
}

table.display td.center {
	text-align: center;
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * DataTables sorting
 */

.sorting_asc {
	background: url('../images/sort_asc.png') no-repeat center right;
}

.sorting_desc {
	background: url('../images/sort_desc.png') no-repeat center right;
}

.sorting {
	background: url('../images/sort_both.png') no-repeat center right;
}

.sorting_asc_disabled {
	background: url('../images/sort_asc_disabled.png') no-repeat center right;
}

.sorting_desc_disabled {
	background: url('../images/sort_desc_disabled.png') no-repeat center right;
}





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * DataTables row classes
 */
table.display tr.odd.gradeA {
	background-color: #ddffdd;
}

table.display tr.even.gradeA {
	background-color: #eeffee;
}

table.display tr.odd.gradeC {
	background-color: #ddddff;
}

table.display tr.even.gradeC {
	background-color: #eeeeff;
}

table.display tr.odd.gradeX {
	background-color: #ffdddd;
}

table.display tr.even.gradeX {
	background-color: #ffeeee;
}

table.display tr.odd.gradeU {
	background-color: #ddd;
}

table.display tr.even.gradeU {
	background-color: #eee;
}


tr.odd {
	background-color: #f9f9f9;
}

tr.even {
	background-color: white;
}





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Misc
 */
.dataTables_scroll {
	clear: both;
}

.dataTables_scrollBody {
	*margin-top: -1px;
}

.top, .bottom {
	padding: 15px;
	background-color: #F5F5F5;
	border: 1px solid #CCCCCC;
}

.top .dataTables_info {
	float: none;
}

.clear {
	clear: both;
}

.dataTables_empty {
	text-align: center;
}

tfoot input {
	margin: 0.5em 0;
	width: 100%;
	color: #444;
}

tfoot input.search_init {
	color: #999;
}

td.group {
	background-color: #d1cfd0;
	border-bottom: 2px solid #A19B9E;
	border-top: 2px solid #A19B9E;
}

td.details {
	background-color: #d1cfd0;
	border: 2px solid #A19B9E;
}


.example_alt_pagination div.dataTables_info {
	width: 40%;
}

.paging_full_numbers {
	margin:25px 0;
	width: 600px;
	height: 22px;
	line-height: 22px;
}

.paging_full_numbers span.paginate_button,
 	.paging_full_numbers span.paginate_active {
	border: 1px solid #fff;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	padding: 5px 10px;
	margin: 0 3px;
	cursor: pointer;
	*cursor: hand;
	color:#333;
}

.paging_full_numbers span.paginate_button {
	background-color: #ddd;
}

.paging_full_numbers span.paginate_button:hover {
	background-color: #f60; color:#fff;
}

.paging_full_numbers span.paginate_active {
	background-color: #f60; color:#fff;
}

table.display tr.even.row_selected td {
	background-color: #B0BED9;
}

table.display tr.odd.row_selected td {
	background-color: #9FAFD1;
}


/*
 * Sorting classes for columns
 */
/* For the standard odd/even */
tr.odd td.sorting_1 {
	background-color: #D3D6FF;
}

tr.odd td.sorting_2 {
	background-color: #DADCFF;
}

tr.odd td.sorting_3 {
	background-color: #E0E2FF;
}

tr.even td.sorting_1 {
	background-color: #EAEBFF;
}

tr.even td.sorting_2 {
	background-color: #F2F3FF;
}

tr.even td.sorting_3 {
	background-color: #F9F9FF;
}


/* For the Conditional-CSS grading rows */
/*
 	Colour calculations (based off the main row colours)
  Level 1:
		dd > c4
		ee > d5
	Level 2:
	  dd > d1
	  ee > e2
 */
tr.odd.gradeA td.sorting_1 {
	background-color: #c4ffc4;
}

tr.odd.gradeA td.sorting_2 {
	background-color: #d1ffd1;
}

tr.odd.gradeA td.sorting_3 {
	background-color: #d1ffd1;
}

tr.even.gradeA td.sorting_1 {
	background-color: #d5ffd5;
}

tr.even.gradeA td.sorting_2 {
	background-color: #e2ffe2;
}

tr.even.gradeA td.sorting_3 {
	background-color: #e2ffe2;
}

tr.odd.gradeC td.sorting_1 {
	background-color: #c4c4ff;
}

tr.odd.gradeC td.sorting_2 {
	background-color: #d1d1ff;
}

tr.odd.gradeC td.sorting_3 {
	background-color: #d1d1ff;
}

tr.even.gradeC td.sorting_1 {
	background-color: #d5d5ff;
}

tr.even.gradeC td.sorting_2 {
	background-color: #e2e2ff;
}

tr.even.gradeC td.sorting_3 {
	background-color: #e2e2ff;
}

tr.odd.gradeX td.sorting_1 {
	background-color: #ffc4c4;
}

tr.odd.gradeX td.sorting_2 {
	background-color: #ffd1d1;
}

tr.odd.gradeX td.sorting_3 {
	background-color: #ffd1d1;
}

tr.even.gradeX td.sorting_1 {
	background-color: #ffd5d5;
}

tr.even.gradeX td.sorting_2 {
	background-color: #ffe2e2;
}

tr.even.gradeX td.sorting_3 {
	background-color: #ffe2e2;
}

tr.odd.gradeU td.sorting_1 {
	background-color: #c4c4c4;
}

tr.odd.gradeU td.sorting_2 {
	background-color: #d1d1d1;
}

tr.odd.gradeU td.sorting_3 {
	background-color: #d1d1d1;
}

tr.even.gradeU td.sorting_1 {
	background-color: #d5d5d5;
}

tr.even.gradeU td.sorting_2 {
	background-color: #e2e2e2;
}

tr.even.gradeU td.sorting_3 {
	background-color: #e2e2e2;
}


/*
 * Row highlighting example
 */
.ex_highlight #example tbody tr.even:hover, #example tbody tr.even td.highlighted {
	background-color: #ECFFB3;
}

.ex_highlight #example tbody tr.odd:hover, #example tbody tr.odd td.highlighted {
	background-color: #E6FF99;
}

.ex_highlight_row #example tr.even:hover {
	background-color: #ECFFB3;
}

.ex_highlight_row #example tr.even:hover td.sorting_1 {
	background-color: #DDFF75;
}

.ex_highlight_row #example tr.even:hover td.sorting_2 {
	background-color: #E7FF9E;
}

.ex_highlight_row #example tr.even:hover td.sorting_3 {
	background-color: #E2FF89;
}

.ex_highlight_row #example tr.odd:hover {
	background-color: #E6FF99;
}

.ex_highlight_row #example tr.odd:hover td.sorting_1 {
	background-color: #D6FF5C;
}

.ex_highlight_row #example tr.odd:hover td.sorting_2 {
	background-color: #E0FF84;
}

.ex_highlight_row #example tr.odd:hover td.sorting_3 {
	background-color: #DBFF70;
}


/*
 * KeyTable
 */
table.KeyTable td {
	border: 3px solid transparent;
}

table.KeyTable td.focus {
	border: 3px solid #3366FF;
}

table.display tr.gradeA {
	background-color: #eeffee;
}

table.display tr.gradeC {
	background-color: #ddddff;
}

table.display tr.gradeX {
	background-color: #ffdddd;
}

table.display tr.gradeU {
	background-color: #ddd;
}

div.box {
	height: 100px;
	padding: 10px;
	overflow: auto;
	border: 1px solid #8080FF;
	background-color: #E5E5FF;
}



/*-----------------------newtable------------------------------*/

table.display {
    clear: both;
    margin: 0 auto;
    width: 100%;
	border-collapse:collapse;
	color:#959393; font-size:12px;
	font-family:"微软雅黑", "Arial", "宋体";
	border:1px solid #fff;
}
table.display thead th {
     border:1px solid #fff; background:#f6f6f6; padding:10px 15px;font-size:14px; font-weight:normal;
}
table.display td {
   border:1px solid #fff; padding:15px;
   table-layout: fixed;word-wrap:break-word;word-break:break-all;
}
tr.odd {
    background-color: #fafafa;
}
.paging_full_numbers span.paginate_button, .paging_full_numbers span.paginate_active {
    color: #B4B4B4;
    cursor: pointer;
	font-size:12px;
    margin: 0 3px;
    padding: 2px 8px;
}
.paging_full_numbers span.paginate_button {
    background-color: #f6f6f6;
}
.paging_full_numbers span.paginate_button:hover {
    background:#d7bc92; color:#fff;
}
.paging_full_numbers span.paginate_active {
    background-color: #d7bc92;
    color: #FFFFFF;
}

.paging_full_numbers span.paginate_button, .paging_full_numbers span.paginate_active{
	border-radius:0	
}