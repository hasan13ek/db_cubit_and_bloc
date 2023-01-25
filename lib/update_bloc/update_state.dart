//------------------------- Update  State --------------------------------//

abstract class ContactUpdateState{}

class InitialState extends ContactUpdateState{}
class LoadInProgress extends ContactUpdateState{}
class LoadInSuccess extends ContactUpdateState{}
class LoadInFailure extends ContactUpdateState{}