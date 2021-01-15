var isIndex = false;
var pageObj;
var sampleMobileMenu = new AXMobileMenu();
var sampleTree = [
    {menuId: "1", label: "Common", url: "javascript:pageObj.goLink('common/docHome.do');", cn: [
            {menuId: "101", label: "AXCore", url: "javascript:pageObj.goLink('common/docHome.do');"},
            {menuId: "102", label: "AXValidator", url: "javascript:pageObj.goLink('samples/AXValidator/index.html');"},
            {menuId: "103", label: "AXAddress", url: "javascript:pageObj.goLink('samples/AXAddress/index.html');"},
            {menuId: "104", label: "Table CSS Guide", url: "javascript:pageObj.goLink('samples/tableStyleGuide/index.html');"}
        ]},
    {menuId: "2", label: "UI-Unique", url: "javascript:pageObj.goLink('samples/AXButton/index.html');", cn: [
            {menuId: "201", url: "javascript:pageObj.goLink('samples/AXButton/index.html');", label: "AXButton"},
            {menuId: "202", url: "javascript:pageObj.goLink('samples/AXInput/index.html');", label: "AXInput"},
            {menuId: "203", url: "javascript:pageObj.goLink('samples/AXSelect/index.html');", label: "AXSelect"},
            {menuId: "204", url: "javascript:pageObj.goLink('samples/AXNotification/index.html');", label: "AXNotification"},
            {menuId: "205", url: "javascript:pageObj.goLink('samples/AXProgress/index.html');", label: "AXProgress"},
            {menuId: "206", url: "javascript:pageObj.goLink('samples/AXScroll/index.html');", label: "AXScroll"},
            {menuId: "207", url: "javascript:pageObj.goLink('samples/AXTabs/index.html');", label: "AXTabs"},
            {menuId: "207", url: "javascript:pageObj.goLink('samples/AXToolBar/index.html');", label: "AXToolBar"}
        ]},
    {menuId: "3", label: "UI-Complex", url: "javascript:pageObj.goLink('samples/AXModal/index.html');", cn: [
            {menuId: "301", url: "javascript:pageObj.goLink('samples/AXModal/index.html');", label: "AXModal"},
            {menuId: "302", url: "javascript:pageObj.goLink('samples/AXGrid/index.html');", label: "AXGrid"},
            {menuId: "303", url: "javascript:pageObj.goLink('samples/AXGridRWD/index.html');", label: "AXGrid RWD"},
            {menuId: "304", url: "javascript:pageObj.goLink('samples/AXTree/index.html');", label: "AXTree"},
            {menuId: "305", url: "javascript:pageObj.goLink('samples/AXEditor/index.html');", label: "AXEditor"},
            {menuId: "306", url: "javascript:pageObj.goLink('samples/AXSearch/index.html');", label: "AXSearch"},
            {menuId: "307", url: "javascript:pageObj.goLink('samples/AXUpload5/index.html');", label: "AXUpload5"},
            {menuId: "308", url: "javascript:pageObj.goLink('samples/AXFrameUpload/index.html');", label: "AXFrameUpload"},
            {menuId: "309", url: "javascript:pageObj.goLink('samples/AXSlideViewer/index.html');", label: "AXSlideViewer"}
        ]},
    {menuId: "4", label: "Lab", url: "javascript:pageObj.goLink('samples/AXTopDownMenu/index.html');", cn: [
            {menuId: "401", url: "javascript:pageObj.goLink('samples/AXTopDownMenu/index.html');", label: "AXTopDownMenu"},
            {menuId: "402", url: "javascript:pageObj.goLink('samples/AXExcelConvert/index.html');", label: "AXExcelConvert"},
            {menuId: "403", url: "javascript:pageObj.goLink('samples/AXModelControl/index.html');", label: "AXModelControl"},
            {menuId: "404", url: "javascript:pageObj.goLink('samples/AXUserSelect/index.html');", label: "AXUserSelect"},
            //{menuId:"405", url:"javascript:pageObj.goLink('samples/AXScheduleCalendar/index.html');", label:"AXScheduleCalendar(alpha)"},
            //{menuId:"406", url:"javascript:pageObj.goLink('samples/AXFrameSet/index.html');", label:"AXFrameSet(alpha)"},
            {menuId: "407", url: "javascript:pageObj.goLink('samples/mobile/index.html');", label: "for Mobile"},
            {menuId: "404", url: "javascript:pageObj.goLink('samples/AXWaterfall/index.html');", label: "AXWaterfall"},
            {menuId: "409", url: "javascript:pageObj.goLink('samples/AXSplit/index.html');", label: "AXSplit"},
            {menuId: "410", url: "javascript:pageObj.goLink('samples/AXDivSlider/index.html');", label: "AXDivSlider"}
            //{menuId:"408", url:"javascript:pageObj.goLink('samples/Angularjs/index.html');", label:"for AngularJS"}
        ]},
    {menuId: "5", label: "Document", url: "javascript:pageObj.goLink('doc/grade01/grade01Home.do');", cn: [
            {menuId: "501", url: "javascript:pageObj.goLink('doc/grade01/grade01Home.do');", label: "Grade 1"},
            {menuId: "502", url: "javascript:pageObj.goLink('doc/grade01/grade02Home.do');", label: "Grade 2"},
            {menuId: "503", url: "javascript:pageObj.goLink('doc/grade01/grade03Home.do');", label: "Grade 3"}
        ]}
];
new AXReq("../../common/auth/selectAuthMenuList.json",
        {
            pars: {systemId: 'EDU'},
            onsucc: function (res) {
                //trace(res);
                sampleTree = res.data;
            },
            async: false,
            onerr: function (res) {
                alert("onFail:" + req.responseText);
            }
        });

var myTabOption = [
    {optionValue: "grade01Home", optionText: "Home", addClass: "Blue", url: "doc/grade01/grade01Home.do"},
    {optionValue: "Default", optionText: "Default", addClass: "Blue", url: "doc/grade01/test1.do"},
    {optionValue: "scriptTab", optionText: "Script Tab", addClass: "Blue", url: "doc/grade01/test2.do"}
];

var sampleTreeMenu = new AXTopDownMenu();
(function () {
    pageObj = {
        host: "",
        goLink: function (url) {
            if (!isIndex) {
                url = "../../" + url;
            }
            location.href = url;
        },
        incHeader: function () {

            if (!isIndex) {
                pageObj.host = "../../";
            } else {

            }

            var ho = [];
            // AXPageHead
            ho.push('<header id="AXPageHead">');
            ho.push('   <div class="ax-wrap">');
            ho.push('       <div class="ax-layer-1">');
            ho.push('           <div class="ax-col-12">');
            ho.push('               <div class="ax-unit">');
            ho.push('                   <nav class="navMenu ">');
            ho.push('                       <h3><a href="' + pageObj.host + 'common/home.do"><img src="' + pageObj.host + 'resources/js/ui/AXJ-logo.png" style="width:110px; height:40px;" /></a></h3>');
            ho.push('                       <div id="sampleMenuBox"></div>');
            ho.push('                   </nav>');
            ho.push('               </div>');
            ho.push('           </div>');
            ho.push('           <div class="ax-clear"></div>');
            ho.push('       </div>');
            ho.push('       <div class="ax-layer-2">');
            ho.push('           <div class="ax-col-12">');
            ho.push('               <div class="ax-unit">');
            ho.push('                   <nav class="themeInfo"></nav>');
            ho.push('               </div>');
            ho.push('           </div>');
            ho.push('           <div class="ax-clear"></div>');
            ho.push('       </div>');
            ho.push('   </div>');
            ho.push('   <button class="AXButton" id="devCentermobileMenu">Menu</button>');
            ho.push('</header>');
            // AXPageHead

            jQuery("#AXPageBody").before(ho.join(""));
            var to = [];
            to.push('<div id="demoPageTabTarget"></div>');
            to.push("<div class='ax-clear'></div>");
            jQuery(".themeInfo").append(to.join(""));
            sampleTreeMenu.setConfig({
                targetID: "sampleMenuBox",
                parentMenu: {
                    className: "parentMenu"
                },
                childMenu: {
                    className: "childMenu",
                    hasChildClassName: "expand", // script 방식에서만 지원 됩니다.
                    align: "left",
                    valign: "top",
                    margin: {top: 0, left: 0},
                    arrowClassName: "",
                    arrowMargin: {bottom: 1, left: 20}
                },
                childsMenu: {
                    className: "childsMenu",
                    hasChildClassName: "expand",
                    align: "left",
                    valign: "bottom",
                    margin: {bottom: -4, left: 0},
                    arrowClassName: "",
                    arrowMargin: {bottom: 13, left: 1}
                }
            });
            sampleTreeMenu.setTree(sampleTree);
            sampleMobileMenu.setConfig({
                reserveKeys: {
                    primaryKey: "menuId",
                    labelKey: "label",
                    urlKey: "url",
                    targetKey: "target",
                    addClassKey: "ac",
                    subMenuKey: "cn"
                },
                menu: sampleTree,
                onclick: function () { // 메뉴 클릭 이벤트
                    sampleMobileMenu.close();
                    eval(this.url.replace("javascript:", ""));
                }
            });
            axdom("#devCentermobileMenu").bind("click", function () {
                sampleMobileMenu.open();
            });

            var pageTabChange = function (selectedObject, value) {
                location.href = "../../" + selectedObject.url;
            };
            var myPageID = "";
            try {
                myPageID = pageID;
            } catch (e) {

            }
            $("#demoPageTabTarget").bindTab({
                value: (myPageID || ""),
                overflow: "scroll",
                options: myTabOption,
                onchange: pageTabChange
            });
        },
        incFooter: function () {
            var fo = [];
            fo.push('<div style="text-align: center;margin: 20px auto;">');
            fo.push('<a href="http://axboot.com/" target="_blank" title="AXBOOT Full Stack Framework"><img src="../../resources/js/samples/_img/banner-axboot.png" height="75" alt="AXBOOT Full Stack Framework"></a>');
            fo.push('<a href="http://ax5.io/" target="_blank" title="jQuery & Bootstrap UI Plugins"><img src="../../resources/js/samples/_img/banner-ax5ui.png" height="75" alt="jQuery & Bootstrap UI Plugins"></a>');
            fo.push('</div>');
            jQuery("#AXPageBody").after(fo.join(""));
        }
    };
    jQuery(document).ready(function () {
        pageObj.incHeader();
        pageObj.incFooter();
    });
})();