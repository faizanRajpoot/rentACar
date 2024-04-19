// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

class Banners {
  String? name;
  String? owner;
  DateTime? creation;
  DateTime? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? title;
  String? route;
  int? dynamicRoute;
  int? published;
  String? contentType;
  int? dynamicTemplate;
  int? insertStyle;
  String? textAlign;
  int? fullWidth;
  int? showTitle;
  int? showSidebar;
  int? enableComments;
  String? doctype;
  List<PageBlock>? pageBlocks;

  Banners({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.title,
    this.route,
    this.dynamicRoute,
    this.published,
    this.contentType,
    this.dynamicTemplate,
    this.insertStyle,
    this.textAlign,
    this.fullWidth,
    this.showTitle,
    this.showSidebar,
    this.enableComments,
    this.doctype,
    this.pageBlocks,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        name: json["name"],
        owner: json["owner"],
        creation:
            json["creation"] == null ? null : DateTime.parse(json["creation"]),
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        docstatus: json["docstatus"],
        idx: json["idx"],
        title: json["title"],
        route: json["route"],
        dynamicRoute: json["dynamic_route"],
        published: json["published"],
        contentType: json["content_type"],
        dynamicTemplate: json["dynamic_template"],
        insertStyle: json["insert_style"],
        textAlign: json["text_align"],
        fullWidth: json["full_width"],
        showTitle: json["show_title"],
        showSidebar: json["show_sidebar"],
        enableComments: json["enable_comments"],
        doctype: json["doctype"],
        pageBlocks: json["page_blocks"] == null
            ? []
            : List<PageBlock>.from(
                json["page_blocks"]!.map((x) => PageBlock.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "modified_by": modifiedBy,
        "docstatus": docstatus,
        "idx": idx,
        "title": title,
        "route": route,
        "dynamic_route": dynamicRoute,
        "published": published,
        "content_type": contentType,
        "dynamic_template": dynamicTemplate,
        "insert_style": insertStyle,
        "text_align": textAlign,
        "full_width": fullWidth,
        "show_title": showTitle,
        "show_sidebar": showSidebar,
        "enable_comments": enableComments,
        "doctype": doctype,
        "page_blocks": pageBlocks == null
            ? []
            : List<dynamic>.from(pageBlocks!.map((x) => x.toJson())),
      };
}

class PageBlock {
  String? name;
  String? owner;
  DateTime? creation;
  DateTime? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? webTemplate;
  List<WebBanner>? webTemplateValues;
  int? addContainer;
  int? addTopPadding;
  int? addBottomPadding;
  int? addBorderAtTop;
  int? addBorderAtBottom;
  int? addShade;
  int? hideBlock;
  int? addBackgroundImage;
  String? parent;
  String? parentfield;
  String? parenttype;
  String? doctype;
  int totalBanners = 0;

  PageBlock({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.webTemplate,
    this.webTemplateValues,
    this.addContainer,
    this.addTopPadding,
    this.addBottomPadding,
    this.addBorderAtTop,
    this.addBorderAtBottom,
    this.addShade,
    this.hideBlock,
    this.addBackgroundImage,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
  });

  factory PageBlock.fromJson(Map<String, dynamic> json) => PageBlock(
        name: json["name"],
        owner: json["owner"],
        creation:
            json["creation"] == null ? null : DateTime.parse(json["creation"]),
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        docstatus: json["docstatus"],
        idx: json["idx"],
        webTemplate: json["web_template"],
        webTemplateValues: json["web_template_values"] == null
            ? []
            : WebBanner.fromJsonToList(jsonDecode(json["web_template_values"])),
        addContainer: json["add_container"],
        addTopPadding: json["add_top_padding"],
        addBottomPadding: json["add_bottom_padding"],
        addBorderAtTop: json["add_border_at_top"],
        addBorderAtBottom: json["add_border_at_bottom"],
        addShade: json["add_shade"],
        hideBlock: json["hide_block"],
        addBackgroundImage: json["add_background_image"],
        parent: json["parent"],
        parentfield: json["parentfield"],
        parenttype: json["parenttype"],
        doctype: json["doctype"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "modified_by": modifiedBy,
        "docstatus": docstatus,
        "idx": idx,
        "web_template": webTemplate,
        "web_template_values": webTemplateValues,
        "add_container": addContainer,
        "add_top_padding": addTopPadding,
        "add_bottom_padding": addBottomPadding,
        "add_border_at_top": addBorderAtTop,
        "add_border_at_bottom": addBorderAtBottom,
        "add_shade": addShade,
        "hide_block": hideBlock,
        "add_background_image": addBackgroundImage,
        "parent": parent,
        "parentfield": parentfield,
        "parenttype": parenttype,
        "doctype": doctype,
      };
}

class WebBanner {
  String? image;
  String? title;
  String? subTitle;
  String? actionLabel;
  String? action;

  static List<WebBanner> fromJsonToList(json) {
    List<WebBanner> l = [];
    // print(json);
    // print(json['slide_1_image']);

    for (String i in ['1', '2', '3', '4', '5']) {
      WebBanner w = WebBanner();
      // print(json['slide_' + i + '_image']);
      w.image = json['slide_' + i + '_image'];
      w.title = json['slide_' + i + '_title'];
      w.subTitle = json['slide_' + i + '_subtitle'];
      w.action = json['slide_' + i + '_action'];
      w.actionLabel = json['slide_' + i + '_action_label'];
      // print(w.image);
      l.add(w);

      // print("its working ${Datum.fromJson(json())}");
    }
    // print(l);
    return l;
  }
}
