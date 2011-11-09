module OWD
  class AsnStatus < Document
    def _build opts = {}
      doc.tag!(self.owd_name) do
        opts[:filters].each do |filt|
          doc.FILTER do
            doc.TYPE filt[:type]
            doc.VALUE filt[:valu]
          end
        end
      end
    end
  end
end
