import 'package:invoiceninja/redux/static/static_state.dart';
import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:invoiceninja/data/models/models.dart';
import 'package:invoiceninja/redux/ui/list_ui_state.dart';

ClientEntity invoiceClientSelector(
    InvoiceEntity invoice, BuiltMap<int, ClientEntity> clientMap) {
  return clientMap[invoice.clientId];
}

var memoizedInvoiceList = memo4((BuiltMap<int, InvoiceEntity> invoiceMap,
        BuiltList<int> invoiceList,
        BuiltMap<int, ClientEntity> clientMap,
        ListUIState invoiceListState) =>
    visibleInvoicesSelector(invoiceMap, invoiceList, clientMap, invoiceListState));

List<int> visibleInvoicesSelector(
    BuiltMap<int, InvoiceEntity> invoiceMap,
    BuiltList<int> invoiceList,
    BuiltMap<int, ClientEntity> clientMap,
    ListUIState invoiceListState) {
  final list = invoiceList.where((invoiceId) {
    final invoice = invoiceMap[invoiceId];
    final client = clientMap[invoice.clientId];
    if (client.isDeleted) {
      return false;
    }
    if (!invoice.matchesStates(invoiceListState.stateFilters)) {
      return false;
    }
    if (!invoice.matchesSearch(invoiceListState.search)) {
      return false;
    }
    return true;
  }).toList();

  list.sort((invoiceAId, invoiceBId) {
    return invoiceMap[invoiceAId].compareTo(invoiceMap[invoiceBId],
        invoiceListState.sortField, invoiceListState.sortAscending);
  });

  return list;
}

String invoiceStatusSelector(InvoiceEntity invoice, StaticState staticState) =>
    staticState.invoiceStatusMap[invoice.invoiceStatusId].name;
