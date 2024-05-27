import { ApiProperty } from "@nestjs/swagger";
import { Type } from "class-transformer";
import { IsOptional, IsString, IsInt, Min, IsBoolean } from "class-validator";

export class SongsQueryDto {
    @IsOptional()
    @IsString()
    @ApiProperty({
      required: false,
      description: 'Search term to look for in song names',
    })
    search?: string;
  
    @IsOptional()
    @IsInt()
    @Min(0)
    @Type(() => Number)
    @ApiProperty({
      required: false,
      description: 'Number of items to skip',
      default: 0,
    })
    skip?: number = 0;
  
    @IsOptional()
    @IsInt()
    @Min(1)
    @Type(() => Number)
    @ApiProperty({
      required: false,
      description: 'Number of items to take',
      default: 10,
    })
    take?: number = 10;
  
    @IsOptional()
    @IsBoolean()
    @Type(() => Boolean)
    @ApiProperty({ required: false, description: 'Filter by explicit content' })
    explicit?: boolean;
  
    @IsOptional()
    @IsString()
    @ApiProperty({
      required: false,
      description: 'Filter by genre',
    })
    genre?: string;
  }
  
