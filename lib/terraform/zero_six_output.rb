# frozen_string_literal: true

# Copyright 2016 New Context Services, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Terraform
  # Behaviour for OutputCommand with Terraform 0.6
  module ZeroSixOutput
    def options
      "-state=#{state}"
    end

    private

    def processed_output(raw_output:)
      return raw_output if return_raw
      raw_output.chomp.tap { |value| return list ? value.split(',') : value }
    end
  end
end