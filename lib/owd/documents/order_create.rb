module OWD
  class OrderCreate < Document
    def _build opts = {}
      doc.tag!(self.owd_name,
               {order_reference:  opts[:order_reference],
                order_source:     opts[:order_source] || 'Web',
                is_gift:          opts[:is_gift] || 'NO',
                backorder_rule:   opts[:backorder_rule] || 'NOBACKORDER',
                hold_for_release: opts[:hold_for_release] || 'NO'}) do

        doc.SHIPPING_INFO opts[:shipping_info] do 
          doc.tag!(:BEST_WAY) do
            opts[:shipping_best_way].collect {|carrier| doc.tag!(:CARRIER, carrier) }
          end if opts[:shipping_best_way]
        end

        doc.BILLING_INFO  opts[:billing_info]

        opts[:line_items].each do |line_item|
          doc.LINE_ITEM line_item
        end if opts[:line_items]

        doc.MESSAGE        opts[:message]        if opts[:message]
        doc.COMMENTS       opts[:comments]       if opts[:comments]
        doc.WAREHOUSENOTES opts[:warehousenotes] if opts[:warehousenotes]
      end
    end
  end
end
