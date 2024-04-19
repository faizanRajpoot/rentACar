// ignore_for_file: prefer_collection_literals, unnecessary_question_mark, prefer_void_to_null, camel_case_types

class form {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? namingSeries;
  String? customer;
  String? pickFrom;
  String? dropTo;
  String? reference;
  String? postingDate;
  String? time;
  String? whichRoute;
  int? customerExpense;
  Null? amendedFrom;
  int? salesOrder;
  String? status;
  String? doctype;
  List<BookItem>? bookItem;

  form(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.docstatus,
      this.idx,
      this.namingSeries,
      this.customer,
      this.pickFrom,
      this.dropTo,
      this.reference,
      this.postingDate,
      this.time,
      this.whichRoute,
      this.customerExpense,
      this.amendedFrom,
      this.salesOrder,
      this.status,
      this.doctype,
      this.bookItem});

  form.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    namingSeries = json['naming_series'];
    customer = json['customer'];
    pickFrom = json['pick_from'];
    dropTo = json['drop_to'];
    reference = json['reference'];
    postingDate = json['posting_date'];
    time = json['time'];
    whichRoute = json['which_route'];
    customerExpense = json['customer_expense_'];
    amendedFrom = json['amended_from'];
    salesOrder = json['sales_order'];
    status = json['status'];
    doctype = json['doctype'];
    if (json['book_item'] != null) {
      bookItem = <BookItem>[];
      json['book_item'].forEach((v) {
        bookItem!.add(BookItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['docstatus'] = docstatus;
    data['idx'] = idx;
    data['naming_series'] = namingSeries;
    data['customer'] = customer;
    data['pick_from'] = pickFrom;
    data['drop_to'] = dropTo;
    data['reference'] = reference;
    data['posting_date'] = postingDate;
    data['time'] = time;
    data['which_route'] = whichRoute;
    data['customer_expense_'] = customerExpense;
    data['amended_from'] = amendedFrom;
    data['sales_order'] = salesOrder;
    data['status'] = status;
    data['doctype'] = doctype;
    if (bookItem != null) {
      data['book_item'] = bookItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookItem {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? item;
  String? serviceItem;
  String? deliveryDate;
  String? returnDate;
  Null? note;
  Null? image;
  int? quantity;
  int? rate;
  String? stockUom;
  int? amount;
  String? parent;
  String? parentfield;
  String? parenttype;
  String? doctype;
  int? iUnsaved;

  BookItem(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.docstatus,
      this.idx,
      this.item,
      this.serviceItem,
      this.deliveryDate,
      this.returnDate,
      this.note,
      this.image,
      this.quantity,
      this.rate,
      this.stockUom,
      this.amount,
      this.parent,
      this.parentfield,
      this.parenttype,
      this.doctype,
      this.iUnsaved});

  BookItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    item = json['item'];
    serviceItem = json['service_item'];
    deliveryDate = json['delivery_date'];
    returnDate = json['return_date'];
    note = json['note'];
    image = json['image'];
    quantity = json['quantity'];
    rate = json['rate'];
    stockUom = json['stock_uom'];
    amount = json['amount'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
    doctype = json['doctype'];
    iUnsaved = json['__unsaved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['docstatus'] = docstatus;
    data['idx'] = idx;
    data['item'] = item;
    data['service_item'] = serviceItem;
    data['delivery_date'] = deliveryDate;
    data['return_date'] = returnDate;
    data['note'] = note;
    data['image'] = image;
    data['quantity'] = quantity;
    data['rate'] = rate;
    data['stock_uom'] = stockUom;
    data['amount'] = amount;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['doctype'] = doctype;
    data['__unsaved'] = iUnsaved;
    return data;
  }
}