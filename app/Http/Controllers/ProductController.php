<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use League\Csv\Reader;
use League\Csv\Statement;


class ProductController extends Controller
{
    /**
     * Import a products from CSV File
     *
     * @param Request $request
     * @return void
     */
    public function import(Request $request): JsonResponse
    {
        $request->validate([
            'file' => 'required|file|mimes:csv,txt',
        ]);

        $csv = Reader::createFromPath($request->file('file')->getRealPath());
        $csv->setHeaderOffset(0);

        $records = (new Statement())->process($csv);

        foreach ($records as $record) {
            Product::create([
                'name' => $record['name'],
                'sku' => $record['sku'],
                'description' => $record['description'],
                'price' => $record['price']
            ]);
        }

        return response()->json(['message' => 'Products imported successfully.']);
    }

    /**
     * Get All Products.
     *
     * @return void
     */
    public function getProducts(): JsonResponse {
        $products = Product::all();
        return response()->json($products, Response::HTTP_OK);
    }
}
