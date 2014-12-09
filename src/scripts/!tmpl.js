(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        define([], factory);
    } else if (typeof exports === 'object') {
        module.exports = factory();
    } else if (typeof root === 'undefined' || root !== Object(root)) {
        throw new Error('templatizer: window does not exist or is not an object');
    } else {
        root.templatizer = factory();
    }
}(this, function () {
    var jade=function(){function e(e){return null!=e&&""!==e}function n(t){return(Array.isArray(t)?t.map(n):t&&"object"==typeof t?Object.keys(t).filter(function(e){return t[e]}):[t]).filter(e).join(" ")}var t={};return t.merge=function r(n,t){if(1===arguments.length){for(var a=n[0],i=1;i<n.length;i++)a=r(a,n[i]);return a}var o=n["class"],s=t["class"];(o||s)&&(o=o||[],s=s||[],Array.isArray(o)||(o=[o]),Array.isArray(s)||(s=[s]),n["class"]=o.concat(s).filter(e));for(var l in t)"class"!=l&&(n[l]=t[l]);return n},t.joinClasses=n,t.cls=function(e,r){for(var a=[],i=0;i<e.length;i++)a.push(r&&r[i]?t.escape(n([e[i]])):n(e[i]));var o=n(a);return o.length?' class="'+o+'"':""},t.style=function(e){return e&&"object"==typeof e?Object.keys(e).map(function(n){return n+":"+e[n]}).join(";"):e},t.attr=function(e,n,r,a){return"style"===e&&(n=t.style(n)),"boolean"==typeof n||null==n?n?" "+(a?e:e+'="'+e+'"'):"":0==e.indexOf("data")&&"string"!=typeof n?(-1!==JSON.stringify(n).indexOf("&")&&console.warn("Since Jade 2.0.0, ampersands (`&`) in data attributes will be escaped to `&amp;`"),n&&"function"==typeof n.toISOString&&console.warn("Jade will eliminate the double quotes around dates in ISO form after 2.0.0")," "+e+"='"+JSON.stringify(n).replace(/'/g,"&apos;")+"'"):r?(n&&"function"==typeof n.toISOString&&console.warn("Jade will stringify dates in ISO form after 2.0.0")," "+e+'="'+t.escape(n)+'"'):(n&&"function"==typeof n.toISOString&&console.warn("Jade will stringify dates in ISO form after 2.0.0")," "+e+'="'+n+'"')},t.attrs=function(e,r){var a=[],i=Object.keys(e);if(i.length)for(var o=0;o<i.length;++o){var s=i[o],l=e[s];"class"==s?(l=n(l))&&a.push(" "+s+'="'+l+'"'):a.push(t.attr(s,l,!1,r))}return a.join("")},t.escape=function(e){var n=String(e).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;");return n===""+e?e:n},t.rethrow=function a(e,n,t,r){if(!(e instanceof Error))throw e;if(!("undefined"==typeof window&&n||r))throw e.message+=" on line "+t,e;try{r=r||require("fs").readFileSync(n,"utf8")}catch(i){a(e,null,t)}var o=3,s=r.split("\n"),l=Math.max(t-o,0),f=Math.min(s.length,t+o),o=s.slice(l,f).map(function(e,n){var r=n+l+1;return(r==t?"  > ":"    ")+r+"| "+e}).join("\n");throw e.path=n,e.message=(n||"Jade")+":"+t+"\n"+o+"\n\n"+e.message,e},t}();

    var templatizer = {};


    // project.jade compiled template
    templatizer["project"] = function tmpl_project(locals) {
        var buf = [];
        var jade_mixins = {};
        var jade_interp;
        var locals_for_with = locals || {};
        (function(project, undefined) {
            var i;
            buf.push('<div class="row"><div class="col-xs-10 col-xs-offset-1 col-sm-12 col-sm-offset-0"><h2>' + jade.escape(null == (jade_interp = project.name) ? "" : jade_interp) + '</h2><p class="type">' + jade.escape(null == (jade_interp = project.type) ? "" : jade_interp) + '</p><p class="description">' + jade.escape(null == (jade_interp = project.description) ? "" : jade_interp) + "</p>");
            if (project.process) {
                buf.push('<p class="process">' + jade.escape(null == (jade_interp = project.process) ? "" : jade_interp) + "</p>");
            }
            buf.push('<ul class="services">');
            (function() {
                var $obj = project.services;
                if ("number" == typeof $obj.length) {
                    for (var $index = 0, $l = $obj.length; $index < $l; $index++) {
                        var service = $obj[$index];
                        buf.push("<li>" + jade.escape(null == (jade_interp = service) ? "" : jade_interp) + "</li>");
                    }
                } else {
                    var $l = 0;
                    for (var $index in $obj) {
                        $l++;
                        var service = $obj[$index];
                        buf.push("<li>" + jade.escape(null == (jade_interp = service) ? "" : jade_interp) + "</li>");
                    }
                }
            }).call(this);
            buf.push('</ul><ul class="software">');
            (function() {
                var $obj = project.software;
                if ("number" == typeof $obj.length) {
                    for (var $index = 0, $l = $obj.length; $index < $l; $index++) {
                        var software = $obj[$index];
                        buf.push("<li>" + jade.escape(null == (jade_interp = software) ? "" : jade_interp) + "</li>");
                    }
                } else {
                    var $l = 0;
                    for (var $index in $obj) {
                        $l++;
                        var software = $obj[$index];
                        buf.push("<li>" + jade.escape(null == (jade_interp = software) ? "" : jade_interp) + "</li>");
                    }
                }
            }).call(this);
            buf.push('</ul></div></div><div class="row">');
            i = 0;
            while (i < project.photos.main) {
                buf.push('<div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-0"><div' + jade.cls([ "project-image", "main", project.slug, "image-" + ++i ], [ null, null, true, true ]) + "></div></div>");
            }
            buf.push("</div>");
            if (project.photos.process) {
                buf.push('<div class="row"><div class="col-xs-10 col-xs-offset-1 col-sm-12 col-sm-offset-0"><h3>The Process</h3></div></div><div class="row">');
                i = 0;
                while (i < project.photos.process) {
                    buf.push('<div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-0 col-md-4 col-md-offset-0"><div' + jade.cls([ "project-image", "process", project.slug, "image-" + ++i ], [ null, null, true, true ]) + "></div></div>");
                }
                buf.push("</div>");
            }
        }).call(this, "project" in locals_for_with ? locals_for_with.project : typeof project !== "undefined" ? project : undefined, "undefined" in locals_for_with ? locals_for_with.undefined : typeof undefined !== "undefined" ? undefined : undefined);
        return buf.join("");
    };

    // work.jade compiled template
    templatizer["work"] = function tmpl_work(locals) {
        var buf = [];
        var jade_mixins = {};
        var jade_interp;
        var locals_for_with = locals || {};
        (function(projects, undefined) {
            (function() {
                var $obj = projects;
                if ("number" == typeof $obj.length) {
                    for (var $index = 0, $l = $obj.length; $index < $l; $index++) {
                        var project = $obj[$index];
                        buf.push('<div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-0 col-md-4 col-md-offset-0"><a' + jade.attr("href", "project.html?name=" + project.slug, true, false) + jade.cls([ "project-thumb", project.slug ], [ null, true ]) + "><p><span>" + jade.escape(null == (jade_interp = project.name) ? "" : jade_interp) + "</span></p></a></div>");
                    }
                } else {
                    var $l = 0;
                    for (var $index in $obj) {
                        $l++;
                        var project = $obj[$index];
                        buf.push('<div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-0 col-md-4 col-md-offset-0"><a' + jade.attr("href", "project.html?name=" + project.slug, true, false) + jade.cls([ "project-thumb", project.slug ], [ null, true ]) + "><p><span>" + jade.escape(null == (jade_interp = project.name) ? "" : jade_interp) + "</span></p></a></div>");
                    }
                }
            }).call(this);
        }).call(this, "projects" in locals_for_with ? locals_for_with.projects : typeof projects !== "undefined" ? projects : undefined, "undefined" in locals_for_with ? locals_for_with.undefined : typeof undefined !== "undefined" ? undefined : undefined);
        return buf.join("");
    };

    return templatizer;
}));