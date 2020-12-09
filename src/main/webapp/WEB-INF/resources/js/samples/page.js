var isIndex = false;
var pageObj;
var sampleMobileMenu = new AXMobileMenu();
var sampleTree = [
    {menuID: "1", label: "Common", url: "javascript:pageObj.goLink('samples/AXCore/index.html');", cn: [
            {menuID: "101", label: "AXCore", url: "javascript:pageObj.goLink('samples/AXCore/index.html');"},
            {menuID: "102", label: "AXValidator", url: "javascript:pageObj.goLink('samples/AXValidator/index.html');"},
            {menuID: "103", label: "AXAddress", url: "javascript:pageObj.goLink('samples/AXAddress/index.html');"},
            {menuID: "104", label: "Table CSS Guide", url: "javascript:pageObj.goLink('samples/tableStyleGuide/index.html');"}
        ]},
    {menuID: "2", label: "UI-Unique", url: "javascript:pageObj.goLink('samples/AXButton/index.html');", cn: [
            {menuID: "201", url: "javascript:pageObj.goLink('samples/AXButton/index.html');", label: "AXButton"},
            {menuID: "202", url: "javascript:pageObj.goLink('samples/AXInput/index.html');", label: "AXInput"},
            {menuID: "203", url: "javascript:pageObj.goLink('samples/AXSelect/index.html');", label: "AXSelect"},
            {menuID: "204", url: "javascript:pageObj.goLink('samples/AXNotification/index.html');", label: "AXNotification"},
            {menuID: "205", url: "javascript:pageObj.goLink('samples/AXProgress/index.html');", label: "AXProgress"},
            {menuID: "206", url: "javascript:pageObj.goLink('samples/AXScroll/index.html');", label: "AXScroll"},
            {menuID: "207", url: "javascript:pageObj.goLink('samples/AXTabs/index.html');", label: "AXTabs"},
            {menuID: "207", url: "javascript:pageObj.goLink('samples/AXToolBar/index.html');", label: "AXToolBar"}
        ]},
    {menuID: "3", label: "UI-Complex", url: "javascript:pageObj.goLink('samples/AXModal/index.html');", cn: [
            {menuID: "301", url: "javascript:pageObj.goLink('samples/AXModal/index.html');", label: "AXModal"},
            {menuID: "302", url: "javascript:pageObj.goLink('samples/AXGrid/index.html');", label: "AXGrid"},
            {menuID: "303", url: "javascript:pageObj.goLink('samples/AXGridRWD/index.html');", label: "AXGrid RWD"},
            {menuID: "304", url: "javascript:pageObj.goLink('samples/AXTree/index.html');", label: "AXTree"},
            {menuID: "305", url: "javascript:pageObj.goLink('samples/AXEditor/index.html');", label: "AXEditor"},
            {menuID: "306", url: "javascript:pageObj.goLink('samples/AXSearch/index.html');", label: "AXSearch"},
            {menuID: "307", url: "javascript:pageObj.goLink('samples/AXUpload5/index.html');", label: "AXUpload5"},
            {menuID: "308", url: "javascript:pageObj.goLink('samples/AXFrameUpload/index.html');", label: "AXFrameUpload"},
            {menuID: "309", url: "javascript:pageObj.goLink('samples/AXSlideViewer/index.html');", label: "AXSlideViewer"}
        ]},
    {menuID: "4", label: "Lab", url: "javascript:pageObj.goLink('samples/AXTopDownMenu/index.html');", cn: [
            {menuID: "401", url: "javascript:pageObj.goLink('samples/AXTopDownMenu/index.html');", label: "AXTopDownMenu"},
            {menuID: "402", url: "javascript:pageObj.goLink('samples/AXExcelConvert/index.html');", label: "AXExcelConvert"},
            {menuID: "403", url: "javascript:pageObj.goLink('samples/AXModelControl/index.html');", label: "AXModelControl"},
            {menuID: "404", url: "javascript:pageObj.goLink('samples/AXUserSelect/index.html');", label: "AXUserSelect"},
            //{menuID:"405", url:"javascript:pageObj.goLink('samples/AXScheduleCalendar/index.html');", label:"AXScheduleCalendar(alpha)"},
            //{menuID:"406", url:"javascript:pageObj.goLink('samples/AXFrameSet/index.html');", label:"AXFrameSet(alpha)"},
            {menuID: "407", url: "javascript:pageObj.goLink('samples/mobile/index.html');", label: "for Mobile"},
            {menuID: "404", url: "javascript:pageObj.goLink('samples/AXWaterfall/index.html');", label: "AXWaterfall"},
            {menuID: "409", url: "javascript:pageObj.goLink('samples/AXSplit/index.html');", label: "AXSplit"},
            {menuID: "410", url: "javascript:pageObj.goLink('samples/AXDivSlider/index.html');", label: "AXDivSlider"}
            //{menuID:"408", url:"javascript:pageObj.goLink('samples/Angularjs/index.html');", label:"for AngularJS"}
        ]}
];
var sampleTreeMenu = new AXTopDownMenu();

(function () {
    pageObj = {
        host: "",
        theme: "arongi",
        themeData: {
            arongi: {
                ver: "1.0",
                developer: "Jowrney Kim",
                mail: "jowrney@axisj.com",
                support: ["DX", "MX"]
            },
            bulldog: {
                ver: "1.0",
                developer: "Dongyoung Kim",
                mail: "young@axisj.com",
                support: ["DX"]
            },
            flybasket: {
                ver: "1.0",
                developer: "Jowrney Kim",
                mail: "jowrney@axisj.com",
                support: ["DX"]
            },
            kakao: {
                ver: "1.0",
                developer: "Jowrney Kim",
                mail: "jowrney@axisj.com",
                support: ["DX"]
            },
            cocker: {
                ver: "0.1 Beta",
                developer: "Jowrney Kim",
                mail: "jowrney@axisj.com",
                support: ["DX"]
            },
            cocker2: {
                ver: "0.1 Beta",
                developer: "Jowrney Kim",
                mail: "jowrney@axisj.com",
                support: ["DX"]
            },
            cocker3: {
                ver: "0.1 Beta",
                developer: "Jowrney Kim",
                mail: "jowrney@axisj.com",
                support: ["DX"]
            },
            cocker4: {
                ver: "0.1 Beta",
                developer: "Jowrney Kim",
                mail: "jowrney@axisj.com",
                support: ["DX"]
            }
        },
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
            ho.push('                       <h3><a href="' + pageObj.host + 'index.html"><img src="' + pageObj.host + 'resources/js/ui/AXJ-logo.png" style="width:110px; height:40px;" /></a></h3>');
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
            to.push('<div id="myTab03"></div>');
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
                    primaryKey: "menuID",
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

            $("#myTab03").bindTab({
                theme: "AXTabsSmall",
                value: "1",
                overflow: "scroll",
                scrollAmount: 5,
                options: [
                    {optionValue: "1", optionText: "★☆★☆★☆ 1살 선택하기 ★☆★☆★☆"},
                    {optionValue: "2", optionText: "2살 선택하기"},
                    {optionValue: "3", optionText: "3살 선택하기", addClass: "Red"},
                    {optionValue: "4", optionText: "4살 선택하기", addClass: "Blue"},
                    {optionValue: "5", optionText: "5살 선택하기", addClass: "Green"},
                    {optionValue: "6", optionText: "6살 선택하기", addClass: "Classic"},
                    {optionValue: "7", optionText: "7살 선택하기"},
                    {optionValue: "8", optionText: "8살 선택하기"},
                    {optionValue: "9", optionText: "9살 선택하기"},
                    {optionValue: "10", optionText: "★☆★☆★☆ 10살 선택하기 ★☆★☆★☆"},
                    {optionValue: "11", optionText: "★☆★☆★☆ 11살 선택하기 ★☆★☆★☆"},
                    {optionValue: "12", optionText: "★☆★☆★☆ 12살 선택하기 ★☆★☆★☆"},
                    {optionValue: "13", optionText: "13살 선택하기"},
                    {optionValue: "14", optionText: "14살 선택하기"},
                    {optionValue: "15", optionText: "15살 선택하기"},
                    {optionValue: "16", optionText: "16살 선택하기"}
                ],
                onchange: function (selectedObject, value) {
                    //toast.push(Object.toJSON(this));
                    //toast.push(Object.toJSON(selectedObject));
                    toast.push(Object.toJSON(value));
                }
            });
        },
        incFooter: function () {
            var fo = [];

            fo.push('<div style="text-align: center;margin: 20px auto;">');
            fo.push('<a href="http://axboot.com/" target="_blank" title="AXBOOT Full Stack Framework"><img src="resources/js/samples/_img/banner-axboot.png" height="75" alt="AXBOOT Full Stack Framework"></a>');
            fo.push('<a href="http://ax5.io/" target="_blank" title="jQuery & Bootstrap UI Plugins"><img src="resources/js/samples/_img/banner-ax5ui.png" height="75" alt="jQuery & Bootstrap UI Plugins"></a>');
            fo.push('</div>');

            jQuery("#AXPageBody").after(fo.join(""));
        }
    };

    jQuery(document).ready(function () {
        pageObj.incHeader();
        pageObj.incFooter();
    });
})();