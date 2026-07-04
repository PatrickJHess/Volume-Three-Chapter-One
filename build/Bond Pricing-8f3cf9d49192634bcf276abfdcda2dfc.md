# 🏛️ Introduction to Bond Pricing
<br>
This chapter introduces the fundamental principles of fixed income. These principles include pricing coupon bonds as a portfolio of zero-coupon bonds, understanding the term structure of interest rates, and examining the relationship between spot and forward rates of interest.

## 💵 The Present Value of a Bond
Chapter One of the volume Time Value Of Money asserted that the value of an asset with certain cash flows equals the present value of its future cash flows. This is shown in the following equation, where $T$ is the total number of cash flow periods, and $PV(t)$ is the present-value factor for a specific cash flow in period $t$:

$$Value = \sum_{t=1}^{T}Cash\_Flow_t\times PV(t)$$

In finance, equating value with present value is ubiquitous and often taken for granted. It is, however, a powerful statement that value depends upon the ability to replicate an asset with other assets. If an asset's cash flow dates and amounts can be perfectly replicated by another asset or a combination of assets, their values must be equal. You might call this idea the law of one price—a concept that is the cornerstone of all pricing models.



### 📜 Coupon Bonds and Zero-Coupon Bonds
Most bonds, though not all, pay fixed coupons in each period and return the principal at maturity. The values of coupon bonds are calculated as:

$$Coupon\,Bond = \sum_{t=1}^{T}Coupon_t\times PV(t) + Principal_T\times PV(T)$$

Some bonds only repay the principal at maturity $T$. Because there are no periodic coupon payments, these are appropriately known as zero-coupon bonds. The values of zero-coupon bonds are calculated as:

$$Zero\,Coupon\,Bond = Principal_T\times PV(T)$$

To price any bond, you must know the present value of payments at the relevant dates. If the zero-coupon bond values are known for those dates, the present value factor for each date can be easily determined. To do so, divide the value of the zero-coupon bond by its principal:

 $$ PV(t)=\frac{Zero\,Coupon\, Bond_t }{Principal_t}$$

Each coupon-bond cash flow is equivalent to an investment in a zero-coupon bond. As such, we can replicate a coupon bond with a sequence of zero-coupon bonds: The number of zero-coupon bonds with a maturity of $t$ equals the coupon bond's cash flow at $t$ divided by the zero-coupon bond's principal. For example, consider a $\$40$ coupon that is paid every six months before maturity. This coupon is valued with a sequence of 0.04 zero-coupon bonds, with a $\$1,000$ principal and maturities matching the coupon payment dates. The coupon bond's payment at maturity equals 1.040 zero-coupon bonds, with a $\$1,000$ principal and the same maturity as the coupon bond. Further, a coupon bond's value is the sum of all the zero-coupon bond values needed to replicate that bond's cash flows. If the coupon bond and the zero-coupon bonds have the same principal, and all the coupon payments of the coupon bond are equal, the value of the coupon bond is:

$$Value = \sum_{t=1}^{T}Zero\,Coupon\,Bond_t\times\frac{Coupon}{Principal}+Zero\,Coupon\,Bond_T$$

We define the sum  as:

$$S(T) =\sum_{t=1}^{T}\frac{Zero\,Coupon\,Bond_t}{Principal} = \sum_{t=1}^{T}PV(t)$$

Thus, the value of the fixed-coupon bond is composed of two components:


$$Value = S(T)\times Coupon+PV(T)\times Principal(T)$$

### ⚖️ Arbitrage and the Value of the Bond

Thus far, bond values have been represented as the sum of theoretical zero-coupon bond values. But we must consider the zero-coupon bonds' market prices—not just their theoretical values. Will this relationship hold if we use actual market prices?

To answer that, let's look at examples where the coupon bond is worth more or less than the sum of the zero-coupon bonds. First, consider a case where the coupon bond's price exceeds the sum of the zero-coupon bond prices:

 $$Value > S(T)\times Coupon+PV(T)\times Principal(T)$$

If the price of the coupon bond exceeds the sum of the zero-coupon bond prices, the coupon bond can be shorted (shorting bonds will be discussed in future chapters). The cheaper zero-coupon bonds can then be purchased with the proceeds, leaving the investor with identical cash flows and a risk-free profit.  

Now, consider if the inequality is reversed:

 $$Value <  S(T)\times Coupon+PV(T)\times Principal(T)$$

In this case, the zero-coupon bonds can be shorted, and the proceeds used to buy the underpriced coupon bond. This ability to flawlessly recreate cash flows guarantees arbitrage between zero-coupon and coupon bonds. Consequently, market forces ensure that coupon bond prices always equal the cost of the zero-coupon bonds used to recreate their cash flows.

This is the law of one price in action. Whatever the bond prices might have been in theory does not matter; theoretical prices are ideas, while market value is a fact. This arbitrage relationship is essential for deriving the term structure of interest rates and forward rates, which are key to understanding both basic bond pricing and complex fixed-income derivatives.

```{tip} ✨ AI Study Assistant-Bond Pricing
:class: dropdown
 
Select a prompt below to open Google AI and explore these concepts further ↗ *(Sign in to save your chat history!)*

---

✨ **[Why is there an inverse relation between interest rates and bond prices? ↗](https://www.google.com/search?udm=50&q=Explain+the+inverse+relationship+between+bond+prices+and+interest+rates)**

---

✨ **[Help with present value for coupon bonds ↗](https://www.google.com/search?udm=50&q=Walk+me+through+the+formula+for+calculating+the+present+value+of+a+coupon+bond)**


---

✨ **[How is the present value formula related to arbitrage?↗](https://www.google.com/search?udm=50&q=How+is+the+present+value+formula+related+to+arbitrage)**
```

## 🧮 Continuous and discrete compounding

For mathematical and computational convenience, our discussion of fixed income and bond pricing will rely primarily on continuously compounded interest rates(♾️). However, it is often appropriate in the real world to quote interest rates as discretely compounded rates (📶).

🔄 This short aside demonstrates how to convert between the two.

Suppose $R_c$ is the continuously compounded annual interest rate for $T$ periods, and $R_d$ is the discretely compounded annual rate for $T$ periods when compounded $d$ times per year. Converting between them requires that the exact same terminal value is realized in $T$ periods:

$$e^{R_c\times T} = (1 + \frac{R_d}{d})^{d\times T}$$

✨ Here, $e$ is Euler's number (the limit of $(1+\frac{1}{d})^{d}$ as $d$ approaches infinity, or continuously compounds). This condition can be expressed as an annualized interest rate by taking the $T$-th root of both sides of the equation:

$$e^{R_c} = (1 + \frac{R_d}{d})^{d}$$

1️⃣ Deriving Continuous from Discrete:

Taking the natural log of both sides derives continuously compounded rates from discretely compounded rates:

$$R_c = d\times \ln(1 + \frac{R_d}{d})$$

2️⃣ Deriving Discrete from Continuous:
Discretely compounded rates can be derived from continuously compounded rates by dividing both sides by the compounding frequency:

$$\frac{R_c}{d} = \ln(1 + \frac{R_d}{d})$$

And then raising Euler's number, $e$, to the power of both sides of the equation:

$$R_d = d\times (e^{\frac{R_c}{d}} - 1)$$

🎯 For instances where rate conversion is necessary, these formulas are highly useful. For the remainder of this chapter, however, we will focus exclusively on continuously compounded rates.

:::{important} 📖 Summary - The Fundamentals of Bond Pricing
:class: dropdown

**In a nutshell:** This chapter explains that the value of any bond is simply the sum of its future cash flows, discounted to the present.

## **🔑 Key Takeaways:**
* **⚖️ The Law of One Price:** A coupon bond is essentially a "package" of zero-coupon bonds. If the price of the package differs from the sum of its parts, an **arbitrage** opportunity exists.
* **🔄 Replication:** We can replicate a coupon bond's cash flows by purchasing specific amounts of zero-coupon bonds. The market price of a bond must equal this replication cost.
* **⏳ Present Value ($PV$):** The value of any bond is calculated using:
    $$Value = \sum_{t=1}^{T}Cash\,Flow_t\times PV(t)$$
* **🧮 Compounding Conversions:** While discrete compounding is common in practice, continuous compounding (using $e$) is often used for mathematical elegance. You can convert between them using:
    $R_c = d \times \ln(1 + \frac{R_d}{d})$

## **🎯 Why this matters:** Understanding that bonds are just bundles of zero-coupon payments allows us to price complex fixed-income derivatives and understand the term structure of interest rates.
:::

