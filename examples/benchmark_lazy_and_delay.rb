#!/usr/bin/env ruby

$: << File.expand_path('../../lib', __FILE__)

require 'benchmark'

require 'concurrent/delay'
require 'concurrent/lazy_reference'

n = 500_000

delay = Concurrent::Delay.new{ nil }
lazy = Concurrent::LazyReference.new{ nil }

delay.value
lazy.value

Benchmark.bmbm do |bm|
  puts 'Benchmarking Delay first, then LazyReference...'
  bm.report { n.times{ delay.value } }
  bm.report { n.times{ lazy.value } }
end
