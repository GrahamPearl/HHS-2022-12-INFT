unit oop;

interface
Uses SysUtils;

type TValidator = class(TObject)
  private
    function checkOnlyInSet(pIn : String; pSet : String) : Boolean;
  public
  constructor Create();
   function checkOnlyCharacters(pIn : String): Boolean;
   function checkOnlyCharactersWithSpace(pIn : String): Boolean;
   function checkOnlyDigits(pIn : String): Boolean;
   function checkNotEmpty(pIn : String): Boolean;
   function checkPassword(pIn : String): Boolean;
end;


type TReport = class(TObject)
    private
       adminNO   : String[7];
       aMark : Integer;
    public
      constructor Create(pAdminNo : String; pMark : Integer);
      procedure updateMark(pMark : Integer);
       function calcSymbol(): Char;
       function display(): String;
       function isPassed(): Boolean;
end;

type TStudent = class(TObject)
      private
        adminNO   : String[7];
        surname   : String;
        firstName : String;
        gender    : String;
        email     : String;
        mobile    : String;

           errors : String;
        function checkFieldSize( data : String; min : Byte; max : Byte) : Boolean;

      public
        constructor Create(pAdminNO : String);
         function getAdminNO(): String;
        procedure setAdminNO(pAdminNO : String);
         function getSurname(): String;
         function getFirstName(): String;
         function getGender(): String;
         function getEmail(): String;
         function getMobile(): String;
        procedure setSurname(pSurname : String);
        procedure setFirstName(pFirstName : String);
        procedure setGender(pGender : String);
        procedure setEmail(pEmail : String);
        procedure setMobile(pMobile : String);

         function getErrors() : String;
        procedure clearErrors();
end;



implementation

{ TStudent }

function TStudent.checkFieldSize(data: String; min, max: Byte): Boolean;
begin
 result  := (LENGTH(data) >= min) AND
            (LENGTH(data) <= max);
end;

procedure TStudent.clearErrors;
begin
  self.errors := '';
end;

constructor TStudent.Create(pAdminNO: String);
begin
  self.errors := '';
  self.setAdminNO(pAdminNO);
end;

procedure TStudent.setAdminNO(pAdminNO: String);
begin
 if checkFieldSize(pAdminNO, 4, 7)
 then self.adminNO := pAdminNO
 else self.errors := self.errors+ #13#10+ 'AdminNO Field size must be between 4-7 characters'
end;

procedure TStudent.setEmail(pEmail: String);
begin
 if checkFieldSize(pEmail, 8, 255) then
    self.email := pEmail;
end;

procedure TStudent.setFirstName(pFirstName: String);
begin
 if checkFieldSize(pFirstName, 2, 50) then
     self.firstName := pFirstName;
end;

procedure TStudent.setGender(pGender: String);
begin
 if checkFieldSize(pGender, 4, 8) then self.gender := pGender;
end;

procedure TStudent.setMobile(pMobile: String);
begin
  if checkFieldSize(pMobile, 10, 10) then self.mobile := pMobile;
end;

procedure TStudent.setSurname(pSurname: String);
begin
  if checkFieldSize(pSurname, 2, 50) then
     self.firstName := pSurname;
end;

function TStudent.getAdminNO: String;
begin
  result := self.adminNO;
end;



function TStudent.getEmail: String;
begin
  result := self.email;
end;

function TStudent.getErrors: String;
begin
  result := self.errors;
end;

function TStudent.getFirstName: String;
begin
 result := self.firstName;
end;

function TStudent.getGender: String;
begin
 result := self.gender;
end;

function TStudent.getMobile: String;
begin
 result := self.mobile;
end;

function TStudent.getSurname: String;
begin
 result := self.surname;
end;

{ TReport }

function TReport.calcSymbol: Char;
var symbol : Char;
begin
  symbol := 'A';
  if self.aMark < 80 then symbol := 'B';
  if self.aMark < 70 then symbol := 'C';
  if self.aMark < 60 then symbol := 'D';
  if self.aMark < 50 then symbol := 'E';
  if self.aMark < 30 then symbol := 'F';

  result := symbol;
end;

constructor TReport.Create(pAdminNo: String; pMark: Integer);
begin
  self.adminNO := pAdminNo;
  self.aMark := pMark;
end;

function TReport.display: String;
begin result := 'Admin No: '+#9+self.adminNO+' got '+IntToStr(self.aMark);
end;

function TReport.isPassed: Boolean;
begin result := (self.aMark >= 30);
end;

procedure TReport.updateMark(pMark: Integer);
begin
{ Note: Mark range is limited from -1 to max.
  -1 represents a student was absent / task not completed.
}
  if pMark > -2 then self.aMark := pMark;
end;

{ TValidator }

function TValidator.checkNotEmpty(pIn: String): Boolean;
begin result := (Length(pIn) > 0);
end;

function TValidator.checkOnlyCharacters(pIn: String): Boolean;
begin result := checkOnlyInSet(pIn, 'ABCDEFGHIJLKMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz');
end;

function TValidator.checkOnlyCharactersWithSpace(pIn: String): Boolean;
begin result := checkOnlyInSet(pIn, 'ABCDEFGHIJLKMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ');
end;

function TValidator.checkOnlyDigits(pIn: String): Boolean;
begin result := checkOnlyInSet(pIn, '0123456789');
end;

function TValidator.checkOnlyInSet(pIn, pSet: String): Boolean;
var iFlag : Boolean;
    iLoop : Integer;
begin
   iFlag := TRUE;
   iLoop := 1;
   { Note: Checks each character of the string
           and no issues found till end of String
   }
   while ((iLoop <= LENGTH(pIN)) AND iFlag) do
   begin
    { Note: Checks that the character is in the alphabet
            Set flag if issue found
    }
       if (POS(pIn[iLoop], pSET) > 0)
       then
       else
          iFlag := FALSE;
       INC(iLoop);
     end;
   result := iFlag;
end;

function TValidator.checkPassword(pIn: String): Boolean;
begin

end;

constructor TValidator.Create;
begin

end;

end.
