import { IsBoolean, IsString } from "class-validator";
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsPositive } from "class-validator";
import { Column, Model, Table } from "sequelize-typescript";

const now = Date.now();

@Table
export class Post extends Model {

  @ApiProperty({
    description: '포스트 고유 번호',
    required: true,
    example: 123,
  })
  @Column
  // @Unique
  @IsNotEmpty()
  no: number;

  @ApiProperty({
    description: '포스트 제목',
    required: true,
    example: '01, 눈내리던 어느 새벽',
  })
  @Column
  @IsString()
  @IsNotEmpty()
  title: string;

  @ApiProperty({
    description: '포스트 내용',
    required: true,
    example: '새벽 내내 잠을 뒤척이다 창문을 열어보았다. 밤새 눈이 내렸나보다.',
  })
  @Column
  @IsString()
  @IsNotEmpty()
  content: string;

  @ApiProperty({
    description: '글쓴이',
    required: true,
    example: '귀요미'
  })
  @Column
  @IsString()
  @IsNotEmpty()
  author: string;

  @ApiProperty({
    description: '포스트 조회수',
    required: true,
    example: 33
  })
  @Column({ defaultValue: 0 })
  @IsNumber()
  @IsPositive()
  viewCount: number;

  @ApiProperty({
    description: '포스팅 일자',
    required: true,
    example: '2023-01-26 03:25:33'
  })
  @Column({ defaultValue: now })
  created: string;

  @ApiProperty({
    description: '포스트 업데이트 일자',
    required: false,
    example: '-'
  })
  @Column
  updated: string;

  @ApiProperty({
    description: '포스팅 존재여부, 존재(true), 삭제(false)',
    required: true,
    example: false,
  })
  @Column({ defaultValue: true })
  @IsBoolean()
  isActive: boolean;

  readonly readOnlyPost: {
    no: number,
    title: string,
    content: string,
    author: string,
    created: string,
    updated: string,
  }
}