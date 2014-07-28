#!jruby -Ku
# encoding: utf-8

require_relative './test3'
require_relative './migemo'
require 'java'
require 'jrubyfx'

class App < JRubyFX::Application
  require 'yaml'
  @@hash = YAML.load_file('./map.yaml')
  @@names = @@hash.keys
  @@stats = 'HABCDS'

  def start(stage)
    index = 0
    lv = nil
    txt = nil
    labelses = []
    with(stage, title: 'ミッドナイトクラクションベイビー', width: 900, height: 450) do
      layout_scene do
        hbox do
          vbox do
            txt = text_field do
              set_on_key_released do
                jp_name = output(get_text)
                if jp_name.length >= 1
                  a = @@names.select {|e| e =~ /^#{jp_name}/ }
                  lv.set_items(observable_array_list(a))
                end
              end
            end
            lv = list_view(pref_height: 380) do
              set_on_mouse_clicked do
                item =  get_selection_model.get_selected_item
                labels = labelses[index % 6]
                labels[0].text = item
                labels[1].text = @@hash[item].h
                labels[2].text = @@hash[item].a
                labels[3].text = @@hash[item].b
                labels[4].text = @@hash[item].c
                labels[5].text = @@hash[item].d
                labels[6].text = @@hash[item].s
                index += 1
                txt.text = ''
                txt.request_focus
              end
            end
            button('Clear') do
              set_on_action do
                labelses.each do |labels|
                  labels.each do |label|
                    label.text = ''
                  end
                end
                index = 0
              end
            end
          end
          vbox do
            3.times do
              hbox do
                2.times do
                  style = "-fx-border-color: black;" + "-fx-border-width: 1;"
                  vbox(style: style) do
                    labels = []
                    labels << label(pref_width: 320, pref_height: 21, text_fill: Color::RED)
                    @@stats.each_char do |e|
                      hbox do
                        label(text: e + ':', pref_height: 21, pref_width: 20, text_fill: Color::BLACK)
                        labels << label(pref_width: 300, pref_height: 21)
                      end
                    end
                    labelses << labels
                  end
                end
              end
            end
          end
        end
      end
      show
    end
  end
end

App.launch
