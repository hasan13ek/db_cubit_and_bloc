abstract class DeleteEvent{}

class DeleteById extends DeleteEvent{
  DeleteById({required this.id});
  final int id;
}