//------------------------- Delete  State --------------------------------//

abstract class ContactDeleteState{}

class InitialStateDelete extends ContactDeleteState{}
class LoadInProgressDelete extends ContactDeleteState{}
class LoadInSuccessDelete extends ContactDeleteState{}
class LoadInFailureDelete extends ContactDeleteState{}