


# Introduction to Bond Pricing


<span style="font-family: 'Garamond', serif;
    font-size: 16px;
    text-indent: 0.25in;
    line-height: 1.5;">

This chapter will introduce some fundamental principles of fixed income. These principles include pricing coupon bonds as a portfolio of zero-coupon bonds, the term structure of interest rates, and the relation between spot and forward rates of interest.
</span>

### <span style="font-family:Franklin Gothic Medium', sans-serif;">The present value of a bond</span>



<span style="font-family: 'Garamond', serif;
    font-size: 16px;
    text-indent: 0.25in;
    line-height: 1.5;">

Chapter One of the volume *Time Value Of Money* asserted that the value of an asset with certain cash flows equals the present value of its cash flows, as shown in the following equation, where  $\ T$ is the total number of cash flow periods, and $\ PV(t)$ is the present-value factor for a certain cash flow in period $t$:

$$ Value = \sum_{t=1}^{T}Cash\,Flow_t\times PV(t)$$

In finance, equating value with present value is ubiquitous and seems unworthy of much thought. It is, however, a powerful statement that value depends upon the ability to replicate an asset with other assets. Namely, if an asset's cash flow dates and amounts can be replicated by another asset or combinations of assets, the values must be equal. You might call this idea the *law of one price*&mdash;a concept that is key in all pricing models.

</span>



### <span style="font-family:Franklin Gothic Medium', sans-serif;">Coupon bonds and zero-coupon bonds</span>

<span style="font-family: 'Garamond', serif;
    font-size: 16px;
    text-indent: 0.25in;
    line-height: 1.5;">

Most bonds, but not all, pay fixed coupons in each period and principal at their maturity. The values of coupon bonds are calculated as:


$$Coupon\, Bond= \sum_{t=1}^{T}Coupon_t\times PV(t)+ Principal_T\times PV(T)$$

Some bonds only repay principal at maturity, or $T$. Because there are no periodic coupon payments, these bonds are appropriately known as zero-coupon bonds. The values of zero-coupon bonds are calculated as:

$$Zero\,Coupon\, Bond =Principal_T\times PV(T)$$

In order to price any bond, it's necessary to know the present value of payments at the relevant dates. If the zero-coupon bond values are known for the relevant dates, the present value of each date can be determined. To do so, dvide the value of the zero-coupon bond by its principal, as shown below:

 $$ PV(t)=\frac{Zero\,Coupon\, Bond_t }{Principal_t}$$

Each coupon-bond cash flow is equivalent to an investment in a zero-coupon bond. As such, we can replicate a coupon bond with a sequence of zero-coupon bonds: The number of zero-coupon bonds with a maturity of $t$ equals the coupon bond's cash flow at $t$ divided by the zero-coupon bond's principal. For example, consider a $\$40$ coupon that is paid every six months before maturity. This coupon is valued with a sequence of 0.04 zero-coupon bonds, with a $\$1,000$ principal and maturities matching the coupon payment dates. The coupon bond's payment at maturity equals 1.040 zero-coupon bonds, with a $\$1,000$ principal and the same maturity as the coupon bond. Further, a coupon bond's value is the sum of all the zero-coupon bond values needed to replicate that bond's cash flows. If the coupon bond and the zero-coupon bonds have the same principal, and all the coupon payments of the coupon bond are equal, the value of the coupon bond is:

$$Value = \sum_{t=1}^{T}Zero\,Coupon\,Bond_t\times\frac{Coupon}{Principal}+Zero\,Coupon\,Bond_T$$

We define the sum  as:

$$S(T) =\sum_{t=1}^{T}\frac{Zero\,Coupon\,Bond_t}{Principal} = \sum_{t=1}^{T}PV(t)$$

And the value of the fixed-coupon bond is composed of two components equaling:


$$Value = S(T)\times Coupon+PV(T)\times Principal(T)$$

## <span style="font-family:Franklin Gothic Medium', sans-serif;">Arbitrage and the value of the bond</span>

<span style="font-family: 'Garamond', serif;
    font-size: 16px;
    text-indent: 0.25in;
    line-height: 1.5;">

Thus far, bond values have been represented as the sum of the zero-coupon bonds' values. But we must consider the zero-coupon bonds' *market prices*&mdash;not their "theoretical" values. Will the value relation between zero-coupon and coupon bonds hold if we use the market prices of zero-coupon bonds? To answer that question, let's look at examples where the coupon bond is worth more or less than the sum of the zero-coupon bonds. First, consider a case where the coupon bond's price exceeds the sum of the zero-coupon bond prices:

 $$Value > S(T)\times Coupon+PV(T)\times Principal(T)$$

If the price of the coupon bond exceeds the sum of the zero-coupon bond prices, the coupon bond can be *shorted* (shorting bonds will be discussed in future chapters). The zero-coupon bonds can then be purchased with the proceeds, leaving the investor with identical cash flows for a lower price. Consider if the inequality is reversed:

 $$Value <  S(T)\times Coupon+PV(T)\times Principal(T)$$

In this case, the *zero-coupon bonds* can be shorted, and the proceeds can be used to buy the coupon bond. This ability to recreate cash flows allows for arbitrage between zero-coupon and coupon bonds; as a result, the coupon bond prices equal the costs of the zero-coupon bonds used to recreate their cash flows. It is the law of one price in action. Whatever the bond prices might have been in theory does not matter. Those prices were ideas&mdash;the market value is a fact. This arbitrage relationship is important for deriving the *term of structure of interest rates* and *forward rates*, which we'll examine later in this chapter. These concepts are key to understanding bond pricing as well as some important fixed-income derivatives.

</span>


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

## <span style="font-family:Franklin Gothic Medium', sans-serif;">Continuous and discrete compounding</span>


 <span style="font-family: 'Garamond', serif;
    font-size: 16px;
    text-indent: 0.25in;
    line-height: 1.5;">

For mathematical and computational convenience, our discussion of fixed income and bond pricing will use continuously compounded interest rates. At times, it's appropriate to quote interest rates as discretely compounded rates. To that end, this short aside demonstrates the conversion between continuously and discretely compounded rates.

Suppose that $R_c$ is the continuously compounded annual interest rate for $T$ periods, and $R_d$ is the discretely compounded annual rate for $T$ periods when compounded $d$ times per year. The conversion of continuously and discretely compounded rates requires that the same values are realized in $T$ periods, shown below:

$$ e^{R_c\times T}  =  (1 + \frac{R_d}{d})^{d\times T}$$

$e$ is Euler's number and is the limit of $(1+\frac{1}{d})^{d}$ as $d$ approaches infinity or continuously compounds. The necessary condition is expressed as an annualized interest rate by taking the $T$ root of both sides of the equation:

$$ e^{R_c} = (1 + \frac{R_d}{d})^{d}$$

Taking natural logs of the previous equation derives continuously compounded rates from discretely compounded rates:

$$\ R_c = d\times ln(1 + \frac{R_d}{d})$$

Finally, discretely compounded rates can be derived from continuously compounded rates by dividing both sides by the compounding frequency, or

$$\frac{R_c}{d} = ln(1 + \frac{R_d}{d})$$

and raising Euler's number, $e$, to both sides of the equation:

$$R_d = d\times (e^\frac{R_c}{d} - 1)$$

For instances in which rate conversion is necessary, the above methods are useful knowledge; for this chapter, however, we'll focus on continuously compounded rates.
</span>
:::{important} 📖 Summary - The Fundamentals of Bond Pricing
:class: dropdown

**In a nutshell:** This chapter explains that the value of any bond is simply the sum of its future cash flows, discounted to the present.

**Key Takeaways:**
* **The Law of One Price:** A coupon bond is essentially a "package" of zero-coupon bonds. If the price of the package differs from the sum of its parts, an **arbitrage** opportunity exists.
* **Replication:** We can replicate a coupon bond's cash flows by purchasing specific amounts of zero-coupon bonds. The market price of a bond must equal this replication cost.
* **Present Value ($PV$):** The value of any bond is calculated using:
    $$Value = \sum_{t=1}^{T}Cash\,Flow_t\times PV(t)$$
* **Compounding Conversions:** While discrete compounding is common in practice, continuous compounding (using $e$) is often used for mathematical elegance. You can convert between them using:
    $R_c = d \times \ln(1 + \frac{R_d}{d})$

**Why this matters:** Understanding that bonds are just bundles of zero-coupon payments allows us to price complex fixed-income derivatives and understand the term structure of interest rates.
:::

