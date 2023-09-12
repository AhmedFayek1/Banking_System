abstract class BankingAppStates {}

class BankingAppInitialState extends BankingAppStates {}

class BankingAppCreateDatabaseState extends BankingAppStates {}
class BankingAppCreateDatabaseErrorState extends BankingAppStates {}

class BankingAppCreateTransferTableState extends BankingAppStates {}
class BankingAppCreateTransferTableErrorState extends BankingAppStates {}

class BankingAppInsertDatabaseState extends BankingAppStates {}
class BankingAppInsertDatabaseErrorState extends BankingAppStates {}

class BankingAppGetDataState extends BankingAppStates {}
class BankingAppGetDataErrorState extends BankingAppStates {}

class BankingAppTransferMoneyState extends BankingAppStates {}
class BankingAppTransferMoneyErrorState extends BankingAppStates {}
