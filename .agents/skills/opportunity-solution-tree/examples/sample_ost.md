# Opportunity Solution Tree Example: Travel & Expense Discovery

Below is a complete real-world example of an Opportunity Solution Tree designed for an enterprise travel expense workflow.

---

## 1. Visual Hierarchy

- 🎯 **Business Outcome**: **Reduce Operational Cost** by reducing expense audit overhead by \$300K/year
  - 📈 **Product Outcome**: Decrease median time from transaction date to expense report submission from 18 days to 3 days
    - 🟡 **Opportunity 1: Employees lose paper receipts while traveling**
      - 🟢 **Solution 1A: Instant Receipt Scanner with Mobile OCR**
        - 🧪 *Assumption Test 1A.1 (Value)*: Interview 10 traveling sales reps; >80% state they would snap receipts immediately after purchase if it takes <5 seconds.
        - 🧪 *Assumption Test 1A.2 (Viability)*: Finance team validates OCR parsed tax IDs meet IRS auditing standards.
      - 🟢 **Solution 1B: SMS-based Receipt Reply on Corporate Card Swipe**
        - 🧪 *Assumption Test 1B.1 (Value)*: Test with 20 beta travelers: do >70% reply to the SMS with a photo within 1 hour of payment?
    - 🟡 **Opportunity 2: Employees find categorizing expense line items confusing**
      - 🟢 **Solution 2A: Smart Merchant Category Code (MCC) Auto-Categorization**
        - 🧪 *Assumption Test 2A.1 (Viability)*: Review 5,000 historic card charges; verify if MCC mapping accurately matches internal GL codes >92% of the time.
      - 🟢 **Solution 2B: Contextual Natural Language Suggestions ("What was this for?")**
        - 🧪 *Assumption Test 2B.1 (Usability)*: Unmoderated test with 12 users to see if auto-suggestions resolve category errors.

---

## 2. FigJam & Miro Importable CSV

Copy and paste the table block below directly onto your Miro or FigJam canvas. It will instantly generate a structured set of sticky notes organized by hierarchy:

```csv
Type,Level,Title,Details,Parent
Outcome,0,"Reduce Expense Audit Cost","Reduce finance operational cost by $300k/yr via faster, cleaner employee expense submissions","None"
Product Outcome,0,"Cut Submission Cycle Time","Decrease median transaction-to-submission time from 18 days to 3 days","Reduce Expense Audit Cost"
Opportunity,1,"Employees lose paper receipts while traveling","Physical receipts get lost, faded, or buried in luggage before submission","Cut Submission Cycle Time"
Opportunity,1,"Employees find categorizing expense items confusing","Employees struggle selecting the correct cost center and GL account code","Cut Submission Cycle Time"
Solution,2,"Mobile Instant Receipt Snap & OCR","Allows employee to snap a photo immediately; auto-extracts merchant, date, and amount","Employees lose paper receipts while traveling"
Solution,2,"SMS Prompt on Card Swipe","Sends instant SMS when corporate card is swiped; employee replies with photo","Employees lose paper receipts while traveling"
Solution,2,"MCC Smart Auto-Categorization","Maps credit card merchant codes directly to company GL expense categories","Employees find categorizing expense items confusing"
Solution,2,"Contextual Natural Language Prompts","Conversational prompt asking purpose of lunch/travel to automatically assign codes","Employees find categorizing expense items confusing"
Assumption Test,3,"Mobile OCR Speed & Willingness","Interview 10 reps: >80% commit to snapping receipt if under 5 seconds","Mobile Instant Receipt Snap & OCR"
Assumption Test,3,"IRS Tax Audit Compliance","Finance & Legal confirm scanned image + OCR metadata satisfy IRS audit rules","Mobile Instant Receipt Snap & OCR"
Assumption Test,3,"MCC Historical Accuracy Check","Historical review of 5k transactions shows >92% accurate category prediction","MCC Smart Auto-Categorization"
```
