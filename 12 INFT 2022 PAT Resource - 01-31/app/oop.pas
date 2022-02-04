unit oop;

interface

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

end.