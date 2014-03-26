require 'spec_helper'
require 'sequelize/migrator/navigator'

describe Sequelize::Migrator::Navigator do
  let(:navigator) { described_class.new(dir) }
  let(:migrations_dir) { File.expand_path('./', 'spec/fixtures/test_migrations') }

  context 'version filenames' do
    let(:dir) { File.join(migrations_dir, 'integer') }

    it 'should at start has 0 version number' do
      expect(navigator.version).to eq(0)
    end

    it 'should support version set' do
      navigator.set(1)
      expect(navigator.version).to eq(1)
    end

    it 'should show next version' do
      navigator.up
      expect(navigator.version).to eq(1)
    end

    it 'should show previous version' do
      navigator.up
      navigator.up
      navigator.down
      expect(navigator.version).to eq(1)
    end

    it "shouldn't switch higher than last version" do
      5.times{ navigator.up }
      expect(navigator.version).to eq(2)
    end

    it "shouldn't switch lower than init version" do
      5.times{ navigator.down }
      expect(navigator.version).to eq(0)
    end

    it 'should switch higher by steps' do
      navigator.up 2
      expect(navigator.version).to eq(2)
    end

    it 'should switch lower by steps' do
      navigator.up 0
      expect(navigator.version).to eq(0)
    end

    it 'should set to last version' do
      navigator.last
      expect(navigator.version).to eq(2)
    end

  end

  context 'timestamp filenames' do
    let(:dir) { File.join(migrations_dir, 'timestamp') }

    it 'should at start has 0 version number' do
      expect(navigator.version).to eq(0)
    end

    it 'should support version set' do
      navigator.set(20140326)
      expect(navigator.version).to eq(20140326)
    end

    it 'should show next version' do
      navigator.up
      expect(navigator.version).to eq(20140326)
    end

    it 'should show previous version' do
      navigator.up
      navigator.up
      navigator.down
      expect(navigator.version).to eq(20140326)
    end

    it "shouldn't switch higher than last version" do
      5.times{ navigator.up }
      expect(navigator.version).to eq(20140405)
    end

    it "shouldn't switch lower than init version" do
      5.times{ navigator.down }
      expect(navigator.version).to eq(0)
    end

    it 'should set to last version' do
      navigator.last
      expect(navigator.version).to eq(20140405)
    end

    it 'should switch higher by steps' do
      navigator.up 2
      expect(navigator.version).to eq(20140405)
    end

    it 'should switch lower by steps' do
      navigator.up 0
      expect(navigator.version).to eq(0)
    end
  end

end