var isIndex = false;
var pageObj;
var sampleMobileMenu = new AXMobileMenu();

var sampleTree = [];
new AXReq("../../common/auth/selectAuthMenuTopList.json",
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
                    /*margin: {bottom: -4, left: 0},*/
                    margin: {top: 0, left: 1},
                    arrowClassName: "",
                    /*arrowMargin: {bottom: 13, left: 1}*/
                    arrowMargin: {bottom: 1, left: 20}
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