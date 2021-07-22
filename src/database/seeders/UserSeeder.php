<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('users')->insert([
            [
                'name' => '宮脇 智也',
                'email' => 'admin@example.com',
                'email_verified_at' => now(),
                'password' => \Hash::make('password'),
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);

        \DB::table('users')->insert([
            [
                'name' => '宮脇 智也2',
                'email' => 'admin2@example.com',
                'email_verified_at' => now(),
                'password' => \Hash::make('password'),
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
