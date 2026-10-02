# Two-Dimensional Story Map Example: Expense Management

This example demonstrates a 2D story map for an employee expense submission feature with a ~3-month Significant Objective: *"Enable field employees to submit clean business trip expense reports in under 5 minutes."*

---

## 1. Visual 2D Story Map Matrix

| Backbone Activity | 1. Access System | 2. Initiate Report | 3. Capture Receipts | 4. Categorize Costs | 5. Review & Submit |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **MVP / Slice 1** | Enter company email & password | Start blank trip report | Snap receipt with phone camera | Select category from dropdown | Tap "Submit to Manager" |
| **Slice 2 (Enhancement)** | Google / Okta SSO login | Duplicate previous trip report | Upload saved PDF from files | Smart OCR auto-suggests category | Preview summary PDF & submit |
| **Slice 3 (Future / Scale)**| FaceID / Biometric login | Auto-generate from calendar event | SMS photo reply to card swipe | Multi-project cost-split allocation | Delegate submission to assistant |

*Read across (horizontal):* "User accesses system, **THEN** initiates report, **THEN** captures receipts, **THEN** categorizes costs, **THEN** reviews & submits."  
*Read down (vertical):* "User snaps receipt with camera, **OR** uploads saved PDF, **OR** replies via SMS."

---

## 2. FigJam & Miro Importable CSV

Highlight and copy the CSV block below, then paste directly into FigJam or Miro to spawn categorized sticky notes:

```csv
RowType,BackboneActivity,StepName,ReleaseSlice,PriorityOrder,Notes
Backbone,"1. Access System","Access System","Backbone",0,"Highway sign: Authentication"
Step,"1. Access System","Enter email & password","Slice 1 (MVP)",1,"Basic email login"
Alternative,"1. Access System","Google / Okta SSO login","Slice 2",2,"Enterprise SSO authentication"
Alternative,"1. Access System","FaceID / Biometric login","Slice 3",3,"Mobile biometric convenience"
Backbone,"2. Initiate Report","Initiate Report","Backbone",0,"Highway sign: Report Setup"
Step,"2. Initiate Report","Start blank trip report","Slice 1 (MVP)",1,"Manual report creation"
Alternative,"2. Initiate Report","Duplicate previous trip","Slice 2",2,"Clone prior trip items"
Alternative,"2. Initiate Report","Auto-generate from calendar","Slice 3",3,"Smart calendar trip detection"
Backbone,"3. Capture Receipts","Capture Receipts","Backbone",0,"Highway sign: Expense Ingestion"
Step,"3. Capture Receipts","Snap receipt with camera","Slice 1 (MVP)",1,"Direct mobile camera scan"
Alternative,"3. Capture Receipts","Upload saved PDF receipt","Slice 2",2,"Upload digital invoice file"
Alternative,"3. Capture Receipts","SMS photo reply on swipe","Slice 3",3,"Frictionless SMS capture"
Backbone,"4. Categorize Costs","Categorize Costs","Backbone",0,"Highway sign: Accounting & GL"
Step,"4. Categorize Costs","Select category from dropdown","Slice 1 (MVP)",1,"Standard manual category list"
Alternative,"4. Categorize Costs","OCR auto-suggests category","Slice 2",2,"Machine learning category match"
Alternative,"4. Categorize Costs","Multi-project cost split","Slice 3",3,"Complex billing allocations"
Backbone,"5. Review & Submit","Review & Submit","Backbone",0,"Highway sign: Approval Workflow"
Step,"5. Review & Submit","Tap Submit to Manager","Slice 1 (MVP)",1,"Basic submit action"
Alternative,"5. Review & Submit","Preview summary PDF & submit","Slice 2",2,"Visual report review before send"
Alternative,"5. Review & Submit","Delegate submission to assistant","Slice 3",3,"Executive assistant workflow"
```
