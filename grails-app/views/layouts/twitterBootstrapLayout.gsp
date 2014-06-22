<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LinkSharing</title>


    <link rel="stylesheet" href="${resource(dir: 'css/bootstrap', file: 'bootstrap.min.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/bootstrap', file: 'londinium-theme.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/bootstrap', file: 'styles.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/bootstrap', file: 'icons.css')}"/>

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>


    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/charts',file: 'sparkline.min.js' )}"></script>

    <script type="text/javascript" src="js/plugins/forms/uniform.min.js"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'uniform.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'select2.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'inputmask.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'autosize.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'inputlimit.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'listbox.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'multiselect.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'validate.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'tags.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms',file: 'switch.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms/uploader',file: 'plupload.full.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms/uploader',file: 'plupload.queue.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms/wysihtml5',file: 'wysihtml5.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms/wysihtml5',file: 'wysihtml5.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/forms/wysihtml5',file: 'toolbar.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'daterangepicker.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'fancybox.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'moment.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'jgrowl.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'datatables.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'colorpicker.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'fullcalendar.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'timepicker.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap/plugins/interface',file: 'collapsible.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap',file: 'bootstrap.min.js' )}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/bootstrap',file: 'application.js' )}"></script>

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body class="sidebar-wide">

<!-- Navbar -->
<div class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header">
        <g:link class="navbar-brand" controller="user" action="userDashBoard"><span title="Link Sharing">Link Sharing</span></g:link>
        <a class="sidebar-toggle"><i class="icon-paragraph-justify2"></i></a>       %{--for side menubar togle--}%
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-icons">
            <span class="sr-only">Toggle navbar</span>
            <i class="icon-grid3"></i>
        </button>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar">
            <span class="sr-only">Toggle navigation</span>
            <i class="icon-paragraph-justify2"></i>
        </button>
    </div>

    <ul class="nav navbar-nav navbar-right collapse" id="navbar-icons">


        <li class="user dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown">
                <img src='${resource(dir: 'images',file: 'sanjeev.jpg')}'>
                <span><ls:userFullName user="${user}"></ls:userFullName></span>
                <i class="caret"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right icons-right">
                <li><g:link controller="user" action="edit"><i class="icon-user"></i> Profile</g:link> </li>
                <li><a href="#"><i class="icon-bubble4"></i> Messages</a></li>
                <li><a href="#"><i class="icon-cog"></i> Settings</a></li>
                <li><g:link controller="logout" action="index"><i class="icon-exit"></i> Logout</g:link></li>
            </ul>
        </li>
    </ul>
</div>
<!-- /navbar -->


<!-- Page container -->
<div class="page-container">


<!-- Sidebar -->
<div class="sidebar collapse">
    <div class="sidebar-content">

        <!-- User dropdown -->
        <div class="user-menu dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="http://placehold.it/300">
                <div class="user-info">
                    Madison Gartner <span>Web Developer</span>
                </div>
            </a>
            <div class="popup dropdown-menu dropdown-menu-right">
                <div class="thumbnail">
                    <div class="thumb">
                        <img src="http://placehold.it/300">
                        <div class="thumb-options">
                            <span>
                                <a href="#" class="btn btn-icon btn-success"><i class="icon-pencil"></i></a>
                                <a href="#" class="btn btn-icon btn-success"><i class="icon-remove"></i></a>
                            </span>
                        </div>
                    </div>

                    <div class="caption text-center">
                        <h6>Madison Gartner <small>Front end developer</small></h6>
                    </div>
                </div>

                <ul class="list-group">
                    <li class="list-group-item"><i class="icon-pencil3 text-muted"></i> My posts <span class="label label-success">289</span></li>
                    <li class="list-group-item"><i class="icon-people text-muted"></i> Users online <span class="label label-danger">892</span></li>
                    <li class="list-group-item"><i class="icon-stats2 text-muted"></i> Reports <span class="label label-primary">92</span></li>
                    <li class="list-group-item"><i class="icon-stack text-muted"></i> Balance <h5 class="pull-right text-danger">$45.389</h5></li>
                </ul>
            </div>
        </div>
        <!-- /user dropdown -->


        <!-- Main navigation -->
        <ul class="navigation">
            <li class="active"><a href="index.html"><span>Dashboard</span> <i class="icon-screen2"></i></a></li>
            <li>
                <a href="#" class="expand"><span>Form components</span> <i class="icon-paragraph-justify2"></i></a>
                <ul>
                    <li><a href="form_components.html">Form components</a></li>
                    <li><a href="form_layouts.html">Form layouts</a></li>
                    <li><a href="form_grid.html">Inputs grid</a></li>
                    <li><a href="wysiwyg.html">WYSIWYG editor</a></li>
                    <li><a href="validation.html">Validation</a></li>
                    <li><a href="file_uploader.html">Multiple file uploader</a></li>
                    <li><a href="form_snippets.html">Form snippets</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Interface components</span> <i class="icon-grid"></i></a>
                <ul>
                    <li><a href="visuals.html">Visuals &amp; notifications</a></li>
                    <li><a href="navs.html">Navs</a></li>
                    <li><a href="panel_options.html">Panel options</a></li>
                    <li><a href="navbars.html">Navbars</a></li>
                    <li><a href="info_blocks.html">Info blocks</a></li>
                    <li><a href="icons.html">Icons <span class="label label-danger">850+</span></a></li>
                    <li><a href="buttons.html">Buttons</a></li>
                    <li><a href="calendar.html">Calendar</a></li>
                    <li><a href="typography.html">Typography</a></li>
                    <li><a href="gallery.html">Media gallery</a></li>
                    <li><a href="header_elements.html">Page header elements</a></li>
                    <li><a href="content_grid.html">Content grid</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Layouts</span> <i class="icon-copy"></i></a>
                <ul>
                    <li><a href="sidebar_wide_left.html">Left wide sidebar</a></li>
                    <li><a href="sidebar_wide_right.html">Right wide sidebar</a></li>
                    <li><a href="sidebar_narrow_left.html">Left narrow sidebar</a></li>
                    <li><a href="sidebar_narrow_right.html">Right narrow sidebar</a></li>
                    <li><a href="sidebar_icons_left.html">Left aligned icons</a></li>
                    <li><a href="sidebar_collapsed.html">Collapsed sidebar</a></li>
                    <li><a href="layout_fixed_navbar.html">Fixed navbar</a></li>
                    <li><a href="horizontal_navigation.html">Horizontal navigation</a></li>
                    <li><a href="horizontal_sidebar.html">Sidebar &amp; Horizontal navigation</a></li>
                    <li><a href="navigation_disabled_items.html">Disabled navigation items</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Task manager</span> <i class="icon-numbered-list"></i></a>
                <ul>
                    <li><a href="task_grid.html">Task grid</a></li>
                    <li><a href="task_list.html">Task list</a></li>
                    <li><a href="task_detailed.html">Task detailed</a></li>
                </ul>
            </li>
            <li><a href="charts.html"><span>Charts</span> <i class="icon-bars"></i></a></li>
            <li>
                <a href="#" class="expand"><span>User</span> <i class="icon-user"></i></a>
                <ul>
                    <li><a href="team.html">Team</a></li>
                    <li><a href="contacts.html">Contact list</a></li>
                    <li><a href="profile.html">User profile</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Support</span> <i class="icon-bubble6"></i></a>
                <ul>
                    <li><a href="faq.html">FAQ's</a></li>
                    <li><a href="chat_tabs.html">Chat with tabs</a></li>
                    <li><a href="chat_contacts.html">Chat with contacts</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Tables</span> <i class="icon-table2"></i></a>
                <ul>
                    <li><a href="tables_static.html">Static tables</a></li>
                    <li><a href="tables_dynamic.html">Data tables</a></li>
                </ul>
            </li>
            <li><a href="search.html"><span>Search page</span> <i class="icon-search3"></i></a></li>
            <li>
                <a href="#" class="expand"><span>Invoice</span> <i class="icon-coin"></i></a>
                <ul>
                    <li><a href="invoice.html">Invoice template</a></li>
                    <li><a href="invoice_list.html">Invoice list</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Login page</span> <i class="icon-user-plus"></i></a>
                <ul>
                    <li><a href="login_simple.html">Simple login form</a></li>
                    <li><a href="login_advanced.html">Login form with user image</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Error pages</span> <i class="icon-warning"></i></a>
                <ul>
                    <li><a href="403.html">403 page</a></li>
                    <li><a href="404.html">404 page</a></li>
                    <li><a href="405.html">405 page</a></li>
                    <li><a href="500.html">500 page</a></li>
                    <li><a href="503.html">503 page</a></li>
                    <li><a href="offline.html">Offline page</a></li>
                    <li><a href="error_sidebar.html">Error page with sidebar</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Blank pages</span> <i class="icon-insert-template"></i></a>
                <ul>
                    <li><a href="blank_left_sidebar.html">Left sidebar</a></li>
                    <li><a href="blank_right_sidebar.html">Right sidebar</a></li>
                    <li><a href="blank_narrow_sidebar.html">Narrow sidebar</a></li>
                    <li><a href="blank_collapsed_sidebar.html">Collapsed sidebar</a></li>
                    <li><a href="blank_full_width.html">Full width page</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="expand"><span>Navigation levels</span> <i class="icon-stack"></i></a>
                <ul>
                    <li><a href="#">Second level first item</a></li>
                    <li><a href="#" class="expand">Second level second item</a>
                        <ul>
                            <li><a href="#">Third level first item</a></li>
                            <li><a href="#">Third level second item</a></li>
                            <li><a href="#" class="expand">Third level third item</a>
                                <ul>
                                    <li><a href="#">Fourth level first item</a></li>
                                    <li><a href="#">Fourth level second item</a></li>
                                    <li><a href="#">Fourth level third item</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Third level second item</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Second level third item</a></li>
                </ul>
            </li>
        </ul>
        <!-- /main navigation -->

    </div>
</div>
<!-- /sidebar -->


<!-- Page content -->
<div class="page-content">


<!-- Page header -->
<div class="page-header">
    <div class="page-title">
        <h3>Dashboard <small>Welcome Sanjeev Kumar Jha. 12 hours since last visit</small></h3>
    </div>

    <div id="reportrange" class="range">
        <div class="visible-xs header-element-toggle">
            <a class="btn btn-primary btn-icon"><i class="icon-calendar"></i></a>
        </div>
        <div class="date-range"></div>
        <span class="label label-danger">9</span>
    </div>
</div>
<!-- /page header -->


<!-- Breadcrumbs line -->
<div class="breadcrumb-line">
    <ul class="breadcrumb">
        <li><a href="index.html">Home</a></li>
        <li class="active">Dashboard</li>
    </ul>

    <div class="visible-xs breadcrumb-toggle">
        <a class="btn btn-link btn-lg btn-icon" data-toggle="collapse" data-target=".breadcrumb-buttons"><i class="icon-menu2"></i></a>
    </div>

    <ul class="breadcrumb-buttons collapse">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-search3"></i> <span>Search</span> <b class="caret"></b></a>
            <div class="popup dropdown-menu dropdown-menu-right">
                <div class="popup-header">
                    <a href="#" class="pull-left"><i class="icon-paragraph-justify"></i></a>
                    <span>Quick search</span>
                    <a href="#" class="pull-right"><i class="icon-new-tab"></i></a>
                </div>
                <g:form controller="topic" action="topicSearch" class="breadcrumb-search">
                    <input type="text" placeholder="Type and hit enter..." name="searchKey" class="form-control autocomplete">


                    <input type="submit" class="btn btn-block btn-success" value="Search">
                </g:form>
            </div>
        </li>


    </ul>
</div>
<!-- /breadcrumbs line -->


<!-- Info blocks -->
<div class="info-blocks">
    <div><g:layoutBody/><div>



</div>
<!-- /info blocks -->



<!-- Page tabs -->

<!-- /page tabs -->


<!-- Footer -->

<!-- /footer -->


</div>
<!-- /page content -->


</div>
<!-- /page container -->

</body>
</html>