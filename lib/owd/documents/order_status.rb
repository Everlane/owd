module OWD
  class OrderStatus < Document
    def _build opts = {}
      doc.tag!(self.owd_name, opts)
    end
  end
end
