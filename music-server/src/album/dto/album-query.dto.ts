import { ApiProperty } from "@nestjs/swagger";
import { Type } from "class-transformer";
import { IsOptional, IsString, IsInt, Min } from "class-validator";

export class AlbumsQueryDto {
    @IsOptional()
    @IsString()
    @ApiProperty({
      required: false,
      description: 'Search term to look for in album names',
    })
    search?: string;
    // select * from album where name = search
  
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
  }
