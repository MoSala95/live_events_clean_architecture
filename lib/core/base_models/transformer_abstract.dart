abstract class TransformerAbstract<DataType, EntityType> {
  EntityType transformToEntityModel(DataType dataModel);
  DataType transformToDataModel(EntityType domain);
  List<EntityType> transformToEntityList(List<DataType> dataModels);
}
