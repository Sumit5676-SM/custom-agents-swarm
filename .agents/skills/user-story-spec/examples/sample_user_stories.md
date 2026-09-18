# Sample User Stories & Feature Specifications

This document illustrates practical, sprint-ready user stories created from an MVP story map slice.

---

## Story 1: Mobile Receipt Photo Capture

**Story Card:**
> **As a** frequent traveling employee,  
> **I want to** snap a photo of my paper receipt with my mobile phone camera,  
> **So that** I can attach it to my expense report immediately before the paper receipt is lost or damaged.

### Conversation Notes
- **Triad Discussion**:
  - Tech Lead flagged that high-resolution smartphone photos can be 8MB+; we should compress images clientside to under 1.5MB before uploading to conserve mobile data and cloud storage costs.
  - Product Designer suggested providing a quick crop/rotation tool right after capturing the photo.
  - Product Discovery Specialist clarified that storing the receipt timestamp and geotag helps auto-verify the expense location.

### Confirmation (Acceptance Criteria)

#### Scenario 1: Successful receipt photo capture
```gherkin
Scenario: Employee captures a receipt using mobile camera
  Given the employee is logged in on a supported mobile device
  And is viewing an active expense report draft
  When the employee taps "Add Receipt" and takes a photo
  Then an image preview is displayed with options: "Use Photo", "Retake", and "Rotate"
  When the employee confirms "Use Photo"
  Then the image is uploaded and compressed to under 1.5 MB
  And a new expense entry is created with the attached receipt thumbnail.
```

#### Scenario 2: Camera permissions denied
```gherkin
Scenario: Camera permissions have not been granted
  Given the mobile device has camera permissions set to disabled
  When the employee taps "Add Receipt"
  Then the app displays a friendly explanation prompt: "Please enable camera access in your settings to snap receipts directly"
  And provides a fallback button: "Upload from Photo Library".
```

#### Rule-Based Criteria
- Supported formats: JPEG, PNG, HEIC.
- Maximum raw upload size: 15 MB (automatically compressed clientside).
- Network offline behavior: If internet connection is unavailable, queue image locally and upload automatically when network reconnects.

---

## Story 2: Manual Expense Line-Item Categorization

**Story Card:**
> **As a** traveling employee submitting expenses,  
> **I want to** select an accounting category from a standardized dropdown list,  
> **So that** my expense report routes to the proper general ledger account without finance rejection.

### Conversation Notes
- Keep the category list concise: top 8 most frequent categories at the top (Meals, Airfare, Hotel, Taxi/Rideshare, Parking, Supplies, Client Entertainment, Other).
- If "Client Entertainment" is selected, IRS regulations require listing the names and company affiliations of attendees.

### Confirmation (Acceptance Criteria)

#### Scenario 1: Standard expense category selection
```gherkin
Scenario: Selecting a standard category
  Given the employee is adding details to a receipt
  When the employee opens the "Expense Category" selector
  Then the 8 most frequent categories are shown at the top of the list
  When the employee selects "Meals & Incidentals"
  Then the category is saved and no extra tax fields are prompted.
```

#### Scenario 2: Selecting client entertainment triggers attendee prompt
```gherkin
Scenario: Selecting Client Entertainment prompts for attendees
  Given the employee selects "Client Entertainment" as the category
  When the category is selected
  Then an "Attendees" required text field appears
  And an inline helper text displays: "IRS compliance: List all attendee names and their company affiliation"
  And the report cannot be submitted if the "Attendees" field contains fewer than 3 characters.
```
