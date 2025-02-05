//Description
@EndUserText.label: 'Products'
//DCL
@AccessControl.authorizationCheck: #NOT_REQUIRED
//VDM Layer
@VDM.viewType: #CONSUMPTION
//Performance
@ObjectModel.usageType:{
    serviceQuality: #C,
    dataClass: #MASTER,
    sizeCategory: #L
}
//Metadata
@Metadata:{
 allowExtensions: true,
 ignorePropagatedAnnotations: false
}
// Key for Fiori UI
@ObjectModel.semanticKey: ['ProductID','ProductName']
-- Enable Fuzzy Search
@Search.searchable: true
-- Header Info (List and Object Page)
@UI.headerInfo: {
    typeName: 'Product',
    typeNamePlural: 'Products   ',
    //imageUrl: 'ImageUrl',
    title:{ value: 'ProductID', type: #STANDARD },
    description: { value: 'ProductName', type: #STANDARD }
}
define view entity ZVKS_C_Products
  as select from ZVKS_R_Products
{
      @Search: {defaultSearchElement: true, fuzzinessThreshold: 0.7}
      @EndUserText:{ label: 'Product', quickInfo: 'Product' }
      @UI:{ lineItem: [{ position: 10, importance: #HIGH }]}
      @ObjectModel.text.element: [ 'ProductName' ]
  key ProductID,

      @Search: {defaultSearchElement: true, fuzzinessThreshold: 0.7}
      //@UI:{ lineItem: [{ position: 20, importance: #HIGH }]}
      ProductName,

      @UI:{ lineItem: [{ position: 30, importance: #MEDIUM }]}
      Category,

      @UI:{ lineItem: [{ position: 40, importance: #MEDIUM }]}
      SubCategory,

      @Semantics.amount.currencyCode: 'Currency'
      @UI:{ lineItem: [{ position: 50, importance: #MEDIUM }]}
      UnitPrice,

      //@UI:{ lineItem: [{ position: 60, importance: #LOW }]}
      Currency,

      @UI:{ lineItem: [{ position: 70, importance: #HIGH, type: #AS_DATAPOINT }], 
            dataPoint:{ visualization: #RATING, targetValue: 5 } }
      Rating,

      @Semantics.quantity.unitOfMeasure: 'BaseUnitOfMeasure'
      //@UI:{ lineItem: [{ position: 80, importance: #MEDIUM }]}
      MaximumQuantity,

      @Semantics.quantity.unitOfMeasure: 'BaseUnitOfMeasure'
      //@UI:{ lineItem: [{ position: 90, importance: #MEDIUM }]}
      MinimumQuantity,

      @Semantics.quantity.unitOfMeasure: 'BaseUnitOfMeasure'
      @EndUserText:{ label: 'Quantity', quickInfo: 'Quantity' }
      @UI:{ lineItem: [{ position: 100, importance: #MEDIUM }]}
      ActualQuantity,

      //@UI:{ lineItem: [{ position: 110, importance: #LOW }]}
      BaseUnitOfMeasure,

      @Semantics.quantity.unitOfMeasure: 'DimensionUnitOfMeasure'
      //@UI:{ lineItem: [{ position: 120, importance: #MEDIUM }]}
      Height,

      @Semantics.quantity.unitOfMeasure: 'DimensionUnitOfMeasure'
      //@UI:{ lineItem: [{ position: 130, importance: #MEDIUM }]}
      Width,

      @Semantics.quantity.unitOfMeasure: 'DimensionUnitOfMeasure'
      //@UI:{ lineItem: [{ position: 140, importance: #MEDIUM }]}
      Depth,

      //@UI:{ lineItem: [{ position: 150, importance: #LOW }]}
      DimensionUnitOfMeasure,

      @Semantics.quantity.unitOfMeasure: 'WeightUnitOfMeasure'
      //@UI:{ lineItem: [{ position: 160, importance: #MEDIUM }]}
      Weight,

      //@UI:{ lineItem: [{ position: 170, importance: #LOW }]}
      WeightUnitOfMeasure,

      @UI:{ lineItem: [{ position: 180, importance: #MEDIUM }]}
      ManufacturerID,

      @UI:{ lineItem: [{ position: 190, importance: #MEDIUM }]}
      SupplierID,

      @UI:{ lineItem: [{ position: 200, importance: #MEDIUM }]}
      ExpiryDate,

      @UI:{ lineItem: [{ position: 25, importance: #HIGH }]}
      BlockedForProcurement,

      /*Administrative Fields*/

      @EndUserText.label: 'Created By'
      @Semantics.user.createdBy: true
      CreatedBy,

      @EndUserText.label: 'Created At'
      @Semantics.systemDateTime.createdAt: true
      CreatedAt,

      @EndUserText.label: 'Local Last Changed By'
      @Semantics.user.localInstanceLastChangedBy: true
      LocalLastChangedBy,

      @EndUserText.label: 'Local Last Changed At'
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt, //Local ETag

      @EndUserText.label: 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt, //Total ETag

      /* Associations */
      _BaseUnitOfMeasure,
      _Currency,
      _DimensionUnitOfMeasure,
      _Manufacturer,
      _Supplier,
      _WeightUnitOfMeasure



}
