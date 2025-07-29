# Lisbon-Portugal-Hotel-Data-Analytics

We analysed three years (2016–2018) of the hotel’s booking and revenue data. After **cleaning the data**, key patterns emerged in revenue trends, guest behavior, and customer segments. In particular, revenue is highly **skewed** toward a few top guests (a classic Pareto pattern), and the business shows **strong seasonality** (peaking in summer). We also segmented customers by recency, frequency, and spend (RFM) to identify loyalty and churn risks. The findings suggest focusing on **retaining high-value guests** and smoothing seasonal demand. Below is a detailed breakdown of each area and actionable recommendations.

## Data Preparation & Cleaning

* **Zero-Revenue Bookings:** We identified about **19,066** bookings with €0 revenue (cancellations/no-shows), including **200 stays** where customers actually checked in but paid nothing (likely comps or promotions, many from Portugal). These inflate occupancy stats and distort RevPAR. We recommend **flagging or excluding** zero-revenue stays in core analyses, so metrics reflect paying guests only.

* **Booking Aggregation:** Since **98% of guests booked only once**, we treated each customer by their first booking. (Multi-bookers were rare.) This simplification ensures metrics like “customers” align with unique stays.

* **Outliers & Skew:** Total revenue per guest is highly right-skewed (a few guests spend much more than average). Rather than drop these high spenders (true VIPs), we kept them but noted their impact. (For some analyses we applied IQR-based filters to see general trends, but we retained all data for overall insights.)

* **Summary:** After cleaning, our analysis focuses on *paying* stays only. This ensures our revenue trends, occupancy, and customer stats truly reflect paying customers and avoid distortion from freebies or unrecorded charges.

## Revenue Performance & Seasonality

* **Skewed Spending (80/20 Rule):** The distribution of total spend per guest follows a Pareto-like pattern: **most customers spend modestly, while a few generate most revenue**. This matches industry norms where \~20% of guests produce \~80% of revenue. Identifying and retaining those top spenders (VIPs or frequent business travelers) is crucial for profitability.

* **Year-over-Year Growth:** Total hotel revenue rose sharply in this period. **2017 revenue was \~38% higher than 2016**, and **2018 was \~6% above 2017**. This indicates strong growth. Management should examine drivers of the 2017 jump (e.g. new marketing, events, renovations) to replicate that success.

* **Seasonal Trends:** Revenue and bookings show **strong summer peaks and winter troughs**:

  * **High season:** May–September each year accounted for the bulk of revenue. For example, **Sept 2018** hit a record **€1.41 M**, with July–Sept 2018 each above €1.2 M.
  * **Low season:** October–December see sharp drops. Dec 2018 fell to €476 K (about a **66% drop** from Sept). On average each Nov–Dec revenue fell **>30% month-over-month**.
  * **Quarterly view:** Q3 (summer) grew from \~€0.8 M (2016) to \~€3.9 M (2018) – nearly **4× growth**. After Q3, Q4 stabilizes at €2.0–2.4 M.

  This aligns with broader European tourism data: for example, Eurostat reports that **\~33% of all EU tourism nights occur in July–August**, emphasizing summer peaks.

  *Implication:* Staffing, budgets, and pricing should follow these cycles. For instance, boost staffing and rates in summer, then run promotions or cost controls in winter. Dynamic pricing (higher in peak, discounts in off-season) and targeted winter packages (e.g. city-break promotions) can help smooth occupancy.

* **Monthly Volatility:** Month-to-month changes were large (e.g., one year saw +193% rise from Feb to Mar, then a 39.5% drop Dec vs Nov). High volatility implies forecasting carefully and monitoring booking pace. Real-time tracking of bookings and cancellations can anticipate surges or dips. (For example, if a key event is scheduled or an OTA promotion runs, bookings may spike unexpectedly.)

* **Channel & Market Mix (Not shown):** Though not detailed here, segmenting revenue by booking channel (e.g. OTA vs direct) and market (country) can reveal which sources produce higher average spend. That insight helps allocate marketing spend. *We suggest analyzing channels similarly to confirm where top guests book, then focusing on those high-revenue channels.*

## Customer Demographics & Booking Behavior

* **Age Distribution:** The hotel’s guests skew **middle-aged**. About **50%+ of bookings** come from **Early (30–44)** and **Late (45–59)** middle-age groups. Seniors (60–74) are also a notable share. **Young adults (18–29)** and children/teens are underrepresented. This suggests the base is mostly professionals or affluent leisure travelers.
  *Implication:* Tailor offerings to these demographics (e.g. comfortable, upscale amenities, quiet rooms). Consider special deals (e.g. group rates, family packages) to attract younger travelers or families, which are currently lacking.

* **Lead Time (Booking Window):** Booking lead times are **right-skewed**:

  * The largest group (\~17k bookings) reserved **31–90 days** in advance (medium-term planners).
  * A significant group (\~9.5k) are **last-minute** (0–7 days out).
  * Early planners (91–180 days) are next, while very early (>180 days) are rare.

  In general, most guests book within \~50 days of arrival. These patterns match travel behavior: last-minute bookings are often locals or nearby tourists, while long lead times often come from international or business travelers.

* **Booking by Market:** Patterns differ by origin country:

  * **Portugal (domestic)** has the largest share of last-minute bookings (\~40%), reflecting local travelers’ flexibility.
  * **Spain, France, others** also skew toward shorter lead times (Spain \~24% last-minute, France \~13%).
  * **Northern/Western Europe & North America** guests book much earlier. For example, **Germany** and **UK** have large shares of very-early planners (>180 days).

  *Action:* Use these patterns to shape promotions. Run **last-minute deals** or flash sales on local channels (OTAs, social media) to fill rooms with domestic travelers. Offer **early-bird discounts** targeting foreign markets (UK, Germany, North America) via travel agents or international OTAs, knowing they plan far ahead. Also, emphasize flexible cancellation policies or loyalty points to these planners to reduce cancellations.

* **Special Requests:** We checked room special requests by guest age:

  * **King-size beds** are the most requested amenity overall, especially among age 30–59 (over 55% of those guests requested it).
  * **Twin beds** are mainly requested by families with children/teens (35%) and seniors (44%), likely for mobility or sharing.
  * **Quiet rooms** are frequently requested by late middle-age guests, showing a preference for tranquility.
  * **Cribs** are most requested by parents in the 26–45 age range (reflecting families with babies/young kids).
  * **High-floor/away-from-elevator** upgrades are liked by middle-aged guests as small upsells.

  *Recommendation:* Use these insights to personalize offers. For example, for mid-age/business guests, proactively offer room upgrades (king bed, quiet room) at booking or check-in. Ensure cribs and twin-bed rooms are readily available for families/seniors. Bundled upsells (quiet room + breakfast, high-floor + drink voucher) can generate extra revenue from those willing to pay for comfort.

## Customer Segmentation (RFM Analysis)

We scored each customer on **Recency (R)**, **Frequency (F)**, and **Monetary (M)** values to segment them into marketing categories:

* **Recency (R):** R=5 if last stay ≤90 days ago (“Just visited”), down to R=1 if >730 days (“Lost”).
* **Frequency (F):** F=1 for 1 booking, up to F=5 for ≥10 bookings.
* **Monetary (M):** M=1 for spend ≤€142, up to M=5 for >€902 total spend.

Combining R, F, M scores defines segments like **Champions** (recent, frequent, big spenders), **Loyal** customers (frequent + high spend), **Potential Loyalists** (moderate scores), **New customers** (very recent but 1-2 bookings), **At-Risk/Need-Attention** (good history but long time since last stay), and **Hibernating/Lost** (inactive or one-timers).

Key findings:

* **Champions & Loyal (≈1% of guests):** These few guests (top RFM scorers) each spend 3–5× more per trip than average and stay \~10× more often. They are gold: top targets for VIP perks and loyalty programs, as they drive disproportionate revenue.

* **One-time Travelers (≈77% of customers):** Surprisingly, **77% of guests booked only once** (“Hibernating” or “Lost”), but **account for \~69% of revenue**. This “leaky bucket” means most revenue comes from guests who never return. For example, the “Hibernating” group (one-time visitors who haven’t returned) alone makes up about half the revenue. This underlines huge churn: very few one-timers convert to repeat stays.

* **New Customers (\~17% of guests):** New arrivals bring \~19% of revenue but rarely return. Converting even a small fraction of these into repeat customers could add millions in revenue (since repeats tend to spend \~4× more over time).

* **Lapsed High-Value (Need Attention):** Small segments of past high spenders (frequent or big spend) have not visited recently (2–3 years ago). Reactivating even a handful could yield outsized ROI, often equivalent to capturing many new customers’ value.

* **Cancelling Trends:** Some mid-tier segments (e.g. “Promising” guests) have higher-than-average cancellation rates. Reducing cancellations (through better communication, flexible booking terms, or incentives) could recover a meaningful chunk of revenue. For instance, recouping just 10% of cancelled bookings in one segment could add tens of thousands of euros.

* **Ancillary Spend Patterns:** We also saw who spends on add-ons (spa, dining, etc.):

  * By **country:** France and Germany guests over-index on ancillaries (\~20% of total spend) versus markets like UK/Spain that spend less on extras.
  * By **segment:** Surprisingly, “At Risk” and “Hibernating” guests have among the highest ancillary ratios (21.9% and 19.7%). Even though they visit rarely, they do buy extras when they do, making them worth winning back.
  * By **age:** Seniors spend the highest share on ancillaries (\~22–29%), while younger adults spend least (\~15–16%). Thus, promoting bundled packages (room + spa or breakfast) to seniors makes sense, and special offers for younger groups could raise their ancillary spend.

Overall, we see classic **RFM segmentation** at work, confirming that **Recency, Frequency, and Monetary value** effectively profile guests into meaningful loyalty segments.

## Key Insights & Recommendations

1. **“Leaky Bucket” – Focus on Retention:** A large majority of revenue comes from one-off visitors. **77% of guests (one-timers) generate 69% of revenue**, yet almost none become repeat customers. This churn is unsustainable. *Recommendation:* Shift emphasis from purely acquiring new guests to **retaining and upselling existing ones**. Even small gains in retention pay huge dividends. (E.g. converting 5% of one-timers to repeat guests could add millions in revenue, given repeat guests spend \~4× more overall.)

2. **Loyalty Ladder – Grow High-Value Segments:** The tiny Champions/Loyal group (<1% of guests) spend 3–5× more per stay. If we can move just 1–2% of one-timers into these top tiers (via loyalty programs, VIP perks, personalized outreach), total revenue could jump by tens of percent. Actions include exclusive offers (point programs, upgrades, birthday gifts) and direct outreach to frequent or big-spending guests.

3. **New Guest Activation:** Each year \~10,000 *new* guests join (17% of base) who contribute 19% of revenue but rarely return. Automated welcome/onboarding campaigns (e.g. thank-you emails, first-stay promotions, loyalty sign-up discounts) can encourage a second booking. Even a modest **5% boost in repeat rate** among new guests could generate millions more.

4. **Seasonal Resource Planning:** Peak demand is May–Sep. Align staff, inventory, and budgets accordingly: ramp up front-desk/housekeeping and marketing entering spring, and fill winter with promotions or cost savings. For example, launch winter or “shoulder season” packages (city breaks, spa retreats, holiday markets) to mitigate off-season dips. Apply **dynamic pricing** (higher rates in summer, discounts in winter) to maximize RevPAR.

5. **Targeted Market & Channel Strategies:** Domestic/nearby travelers book late, distant travelers book early. Tailor promotions accordingly:

   * **Last-minute deals** on local OTAs and social media to capture Portugal/Spain guests who book under 2 weeks out.
   * **Early-bird offers** for UK/Germany/North America markets (who plan >90 days ahead) via international agents and loyalty programs.
   * Emphasize flexible cancellation and loyalty benefits in communications to reduce drop-offs for those markets that are prone to cancel.

6. **Personalization & Upsells:** Leverage guest demographic and preference data:

   * Promote **king-size/quiet-room upgrades** to mid-aged and business travelers. Ensure families know twin-room and crib options are available.
   * Offer bundled **ancillary packages** (e.g. room+breakfast, spa deals) targeted by age and origin. Seniors can be pitched spa/dining bundles (they spend more on extras), while younger adults might need value-add incentives.
   * Use special requests history: e.g. automatically assign known requests (like preferred floor) or pre-offer upgrades to frequent VIPs. This enhances experience and revenue.

7. **Measure, Monitor, Adjust:** In analytics and KPIs, **tag/exclude zero-revenue stays** so metrics like RevPAR, ADR reflect paying business only. Continuously track booking trends by segment (especially cancellation rates). For example, if the “Promising” segment has a 20% cancellation rate, find ways to lower it – recouping even 10% of those lost bookings might recover €100K+ annually.

**Contextual Note:** This analysis covers 2016–2018. Since then, external factors (notably the COVID-19 pandemic) dramatically reshaped travel. For example, EU tourism nights plunged \~51% in 2020. By 2025 however, travel is rebounding: one report shows European arrivals in Q2 2025 were up 3.3% year-over-year. Still, **the core insights hold**: hospitality remains highly seasonal, a small share of loyal guests delivers outsized revenue, and customer lifetime value relies on retention. Post-pandemic recovery data confirm ongoing strong summer demand but also rising off-season travel as people seek value.

**Conclusion:** The data paint a classic “leaky bucket” picture: many guests come once and don’t return. The highest ROI for the hotel lies in **getting more value from existing customers**, not just chasing new ones. By implementing segmented marketing (loyalty rewards, win-back campaigns, personalized offers) and aligning operations with demand cycles, the hotel can significantly boost guest lifetime value and overall profitability.

