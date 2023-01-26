import { IsString } from "class-validator";
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsPositive } from "class-validator/types/decorator/decorators";
import { Column, Model, Table, Unique } from "sequelize-typescript";

const now = Date.now();

@Table
export class Post extends Model {

  @ApiProperty({
    description: '포스트 고유 번호',
    required: true,
  })
  @Column
  @Unique
  @IsNotEmpty()
  no: number;

  @ApiProperty({
    description: '포스트 제목',
    required: true,
  })
  @Column
  @IsString()
  @IsNotEmpty()
  title: string;

  @ApiProperty({
    description: '포스트 내용',
    required: true,
  })
  @Column
  @IsString()
  @IsNotEmpty()
  content: string;

  @ApiProperty({
    description: '글쓴이',
    required: true,
  })
  @Column
  @IsString()
  @IsNotEmpty()
  author: string;

  @ApiProperty({
    description: '포스트 조회수',
    required: true,
  })
  @Column({ defaultValue: 0 })
  @IsNumber()
  @IsPositive()
  viewCount: number;

  @ApiProperty({
    description: '포스팅 일자',
    required: true,
  })
  @Column({ defaultValue: now })
  created: string;

  @ApiProperty({
    description: '포스트 업데이트 일자',
    required: false,
  })
  @Column
  updated: string;

  @ApiProperty({
    description: '포스팅 삭제여부',
    required: true,
  })
  @Column({ defaultValue: true })
  isActive: boolean;
}