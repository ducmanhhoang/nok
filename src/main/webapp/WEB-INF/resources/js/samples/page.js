var isIndex = false;
var pageObj;
var sampleMobileMenu = new AXMobileMenu();
var sampleTreeMenu = new AXTopDownMenu();
var progressObj = $('#AXProgress');

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

var sampleTree = [];
new AXReq("../../M000000/G001300/F001311/selectAuthMenuTopList.json",
        {
            pars: {},
            onsucc: function (res) {
                //trace(res);
                sampleTree = res;
            },
            async: false,
            onerr: function (res) {
                alert("onFail:" + req.responseText);
            }
        });

var myTabOption = [];
new AXReq("../../M000000/G001300/F001311/selectAuthMenuTabList.json",
        {
            pars: {menuId: menuId},
            onsucc: function (res) {
                //trace(res);
                myTabOption = res;
            },
            async: false,
            onerr: function (res) {
                alert("onFail:" + req.responseText);
            }
        });

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
            ho.push('                   <nav class="navMenu">');
            ho.push('                       <h3><a href="' + pageObj.host + '"><img src="' + pageObj.host + 'resources/js/ui/AXJ-logo.png" style="width:110px; height:40px;" /></a></h3>');
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

            var to = [], tdata = pageObj.themeData[pageObj.theme];
            to.push("<div class='logo'><img src='" + pageObj.host + "resources/js/ui/" + pageObj.theme + "/images/dx-theme-logo.png' /></div>");
            to.push("<h1>");
            to.push("<span>" + pageObj.theme.substring(0, 1).toUpperCase() + pageObj.theme.substring(1) + "</span> ver" + tdata.ver + "&nbsp;&nbsp;");
            for (var b = 0; b < tdata.support.length; b++) {
                to.push("<span class='support'>" + tdata.support[b] + "</span>");
            }
            to.push("</h1>");
            to.push("<h2>Theme Developer. <a href='mailto:" + tdata.mail + "'>" + tdata.developer + "</a></h2>");
            to.push("<a href='http://www.axisj.com' target='_blank' class='facebook'>Website</a>");
            to.push("<a href='https://github.com/axisj/axisj' target='_blank' class='github'>Github</a>");
            to.push("<a href='javascript:pageObj.logout()' class='api'>Logout</a>");
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

            var pageTabChange = function (selectedObject, value) {
                location.href = "../../" + selectedObject.url;
            };
            var myMenuId = "";
            try {
                myMenuId = menuId;
            } catch (e) {

            }
            $("#demoPageTabTarget").bindTab({
                value: (myMenuId || ""),
                overflow: "scroll",
                options: myTabOption,
                onchange: pageTabChange
            });
        },
        incFooter: function () {
            var fo = [];

            fo.push('<div style="text-align: center;margin: 20px auto;">');
            fo.push('<a href="http://axboot.com/" target="_blank" title="AXBOOT Full Stack Framework"><img src="' + pageObj.host + 'resources/js/samples/_img/banner-axboot.png" height="75" alt="AXBOOT Full Stack Framework"></a>');
            fo.push('<a href="http://ax5.io/" target="_blank" title="jQuery & Bootstrap UI Plugins"><img src="' + pageObj.host + 'resources/js/samples/_img/banner-ax5ui.png" height="75" alt="jQuery & Bootstrap UI Plugins"></a>');
            fo.push('</div>');

            fo.push('<footer id="AXPageFoot">');
            fo.push('   <div class="ax-wrap">');
            fo.push('       <div class="ax-layer-1">');
            fo.push('           <div class="ax-col-12">');
            fo.push('               <div class="ax-unit">');
            fo.push('                   <nav class="navTheme">');
            fo.push("                       <ul>");
            axf.each(pageObj.themeData, function (k, v) {
                fo.push("                       <li><a href='javascript:pageObj.changeTheme(\"" + k + "\");' class='themeSelector' id='" + k + "'>" + k + "</a></li>");
            });
            fo.push("                       </ul>");
            fo.push("                       <div class='ax-clear'></div>");
            fo.push('                   </nav>');
            fo.push('               </div>');
            fo.push('           </div>');


            fo.push('           <div style="position:absolute;top: -30px;right: 7px;">');

            fo.push('               <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank" style="display:inline;margin:0px;padding:0px;">');
            fo.push('                   <input type="hidden" name="cmd" value="_s-xclick">');
            fo.push('                   <input type="hidden" name="hosted_button_id" value="TCMG6LS7X2VFE">');
            fo.push('                   <button class="AXButtonSmall">Donate</button>');
            fo.push('               </form>');

            fo.push('           </div>');

            fo.push('           <div class="ax-clear"></div>');
            fo.push('       </div>');
            fo.push('   </div>');
            fo.push('</footer>');
            jQuery("#AXPageBody").after(fo.join(""));
        },
        changeTheme: function (newTheme) {
            if (!newTheme || newTheme == "null")
                return;
            AXUtil.setCookie("AXISTHEME", newTheme);

            window.location.reload();
            return;

            pageObj.theme = newTheme;
            toast.push(newTheme + "가 적용 되었습니다.");

        },
        initTheme: function () {

            var gt = AXUtil.getCookie("AXISTHEME");
            if (gt) {
                setTimeout(function () {
                    console.log(gt);
                }, 1000);
            }
        },
        changeThemeButton: function (tm) {
            $(".themeSelector").removeClass("on");
            $("#" + tm).addClass("on");
        },
        logout: function () {
            new AXReq("../../logout",
                    {
                        pars: {},
                        onsucc: function (res) {
                            console.log(res);
                        },
                        async: false,
                        onerr: function (res) {
                            alert("onFail:" + req.responseText);
                        },
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader(header, token);
                        }
                    });
            window.location.reload();
        }
    };

    jQuery(document).ready(function () {
        pageObj.incHeader();
        pageObj.incFooter();
        $(window).on('load', function () {
            progressObj.hide();
        });
    });
})();