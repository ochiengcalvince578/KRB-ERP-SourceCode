#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50364 "Membership App Nominee Detail"
{
    PageType = List;
    SourceTable = "Member App Nominee";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Relationship; Rec.Relationship)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    // ShowMandatory = true;
                }
                field("Next Of Kin Type"; Rec."Next Of Kin Type")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }

                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                }

                // field(Age; Rec.Age)
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ShowMandatory = true;

                //     trigger OnValidate()
                //     var
                //         GuardianRec: Record "Member App Nominee";

                //         AgeInt: Integer;
                //     begin
                //         if Evaluate(AgeInt, Rec.Age) and (AgeInt < 18) then begin
                //             Message('Nominee is under 18. Adding an entry for guardian details.');

                //             // Initialize a new record for the guardian
                //             GuardianRec.Init();
                //             GuardianRec.Name := ''; // Placeholder for guardian name
                //             GuardianRec."Next Of Kin Type" := GuardianRec."Next Of Kin Type"::"Guardian/Trustee";
                //             GuardianRec."Date of Birth" := 0D;
                //             GuardianRec.Telephone := '';
                //             GuardianRec."%Allocation" := 0;
                //             GuardianRec.Insert();

                //             CurrPage.Update(false);
                //         end
                //     end;
                //}




                // field(Address; Rec.Address)
                // {
                //     ApplicationArea = Basic;
                // }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                // field(Description; Rec.Description)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Email; Rec.Email)
                // {
                //     ApplicationArea = Basic;
                // }
                field("ID No."; Rec."ID No.")
                {
                    Caption = 'Id/Birth Cert No.';
                    ApplicationArea = Basic;
                }

                field("Location"; Rec."Location")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("%Allocation"; Rec."%Allocation")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
            }
        }
    }
    actions
    {
    }

    trigger OnOpenPage()
    begin

        MemberApp.Reset;
        MemberApp.SetRange(MemberApp."No.", Rec."Account No");
        if MemberApp.Find('-') then begin
            if MemberApp.Status = MemberApp.Status::Approved then begin                        //MESSAGE(FORMAT(MemberApp.Status));
                CurrPage.Editable := false;
            end else
                CurrPage.Editable := true;
        end;
        Rec."Maximun Allocation %" := 100;
    end;

    var
        MemberApp: Record 51360;
        ReltnShipTypeEditable: Boolean;
}

