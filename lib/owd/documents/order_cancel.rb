module OWD
  class OrderCancel < Document
    def _build opts = {}
      clientOrderId = opts.delete(:clientOrderId)
      doc.tag!(self.owd_name, clientOrderId: clientOrderId)
    end
  end
end
