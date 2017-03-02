module OWD
  class OrderUpdate < Document
    def _build opts = {}
      doc.tag!(self.owd_name,
              { clientOrderId:  opts[:order_reference] }) do

        doc.SHIP_NAME             opts[:first_name]     if opts[:first_name]
        doc.SHIP_COMPANY          opts[:company_name]   if opts[:company_name]
        doc.SHIP_ADDRESS_ONE      opts[:address_one]    if opts[:address_one]
        doc.SHIP_ADDRESS_TWO      opts[:address_two]    if opts[:address_two]
        doc.SHIP_CITY             opts[:city]           if opts[:city]
        doc.SHIP_STATE            opts[:state]          if opts[:state]
        doc.SHIP_POSTCODE         opts[:zip]            if opts[:zip]
        doc.SHIP_COUNTRY          opts[:country]        if opts[:country]
        doc.SHIP_PHONE            opts[:phone]          if opts[:phone]
        doc.SHIP_EMAIL            opts[:email]          if opts[:email]
      end
    end
  end
end
