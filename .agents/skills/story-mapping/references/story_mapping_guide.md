# Two-Dimensional Story Mapping Reference Guide

This guide provides in-depth principles and facilitation techniques for creating 2D story maps based on Mike Cohn and Jeff Patton's methodologies.

---

## 1. Key Vocabulary & Concepts

- **Backbone**: The top horizontal row of the story map. Cards in the backbone represent high-level activities or functional chapters. Like signs on a highway, they signal when a user transitions to a new domain (e.g., "Welcome to Checkout", "Welcome to Report Review"). Teams do not implement the backbone directly; rather, they implement the specific steps and alternatives underneath it.
- **Narrative Sequence**: The horizontal flow across the map. Reading left-to-right uses the word **"then"** (*"User browses catalog, then adds to cart, then enters shipping, then pays"*).
- **Alternatives**: The vertical flow down each column. Reading top-to-bottom uses the word **"or"** (*"User pays with credit card, or pays with PayPal, or uses Apple Pay"*).
- **Walking Skeleton / MVP**: The minimal, functional end-to-end slice through every backbone activity that allows real users to complete the journey and deliver real value.
- **Submaps**: Used when an individual card represents a complex sub-system. A submap allows the team to "zoom in" and expand a single card into its own 2D story map without cluttering the master map.

---

## 2. Facilitating a Story Mapping Workshop

### Participants
- **Product Discovery Lead / Product Manager**: Guides the business objective, articulates customer problems, and establishes rough initial priorities.
- **Engineers / Tech Leads**: Provide technical feasibility insights, identify architectural dependencies, and spot technical risks.
- **Product Designers**: Ensure the end-to-end user experience is coherent and identify usability friction.
- **Stakeholders & Domain Experts**: Offer context on operational, regulatory, or sales constraints.

### Practical Rules of Thumb
1. **Cards are short phrases, not full stories**: Write 3–4 word notes during mapping (e.g., *"Upload PDF receipt"*, *"Select GL code"*, *"Confirm mileage"*). Writing full user stories during mapping slows down discussion and kills creative momentum. Full user stories are written *after* the map is established.
2. **Prioritization is rough and directional**: Stacking cards down a column is intended to spark conversations about what is essential versus what is a fast-follow. It is not an unchangeable contract.
3. **Keep the horizon bounded**: Focus on a single Significant Objective achievable in approximately 3 months. If multiple objectives exist, finish the story map for the first objective before starting the second.

---

## 3. Conversational Discovery Walkthroughs

Once an initial map is drafted, test its completeness by roleplaying a user's walkthrough. Stay conversational, curious, and fluid:
- Look for gaps: *"What does the user expect immediately after completing this step?"*
- Look for failure modes: *"What if their connection drops or their file format is unsupported?"*
- Look for ambiguities: *"Does the user know which department to route this to?"*
- Look for edge cases: *"What happens if an employee incurs expenses in multiple foreign currencies on the same day?"*

---

## 4. Release Slicing & Product Roadmaps

A story map easily converts into a dynamic roadmap by drawing horizontal release cut lines:
- **Slice 1 (MVP)**: Proves the value proposition and tests core assumptions with early adopters.
- **Slice 2**: Expands usability, adds convenience alternatives, and automates manual steps.
- **Slice 3**: Edge-case handling, power-user optimizations, and enterprise integrations.
