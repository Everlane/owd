module OWD
  class OrderRelease < Document
    def _build opts = {}
      doc.tag!(self.owd_name,
              { clientOrderId: opts[:order_reference] })
    end
  end
end
